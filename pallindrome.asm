.model small
.stack 100h

.data 
newline db 10,13, '$' 
msg db 'Pallindrome','$'
notmsg db 'Not Pallindrome','$'
output db 254 dup('$')  

paralist label byte
maxlen db 255
len db ?
input db 254 dup('$')

.code
mov ax, @data
mov ds, ax

mov ah, 0ah
mov dx, paralist
int 21h
                      
mov ah,09h
mov dx, offset newline
int 21h


mov si, offset input
mov di, offset input

revsi: 
inc si
cmp [si], '$'
je revcomplete
jmp revsi

revcomplete:
dec si ; twice  because of CRET
dec si

mov cl, len
mov ch,00

check:
mov al, [si]
mov dl, [di]
cmp al,dl
jne notpallindrome
dec si
inc di
loop check

mov ah, 09h 
mov dx, offset msg
int 21h

jmp exit

notpallindrome:
mov ah, 09h 
mov dx, offset notmsg
int 21h

exit:

mov ax, 4c00h
int 21h

end