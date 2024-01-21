.model small
.stack 100h

.data 
; For display only program
string db 'Pokhara University','$'   

; for newline program
newline db 10,13,'$' 

;for input program
paralist label byte
maxchar db 255
len db ?
input db 254 dup(?)

.code
main proc far
mov ax, @data
mov ds, ax

;Using 09h
mov ah,09h
mov dx, offset string
int 21h 

; newline
mov ah, 09h
mov dx, offset newline
int 21h

; Without using 09h
mov si, offset string
again:
cmp [si],'$'
je complete
mov ah, 02h
mov dl, [si]
int 21h
inc si
jmp again
complete:
mov ax, 4c00h
int 21h


main endp
end main
