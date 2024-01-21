.model small
.stack 100h
                                                        
.data
newline db 10,13,'$' ; stores newline string and CRET refer asciicode

paralist label byte ;define label as name paralist
maxchar db 255 
length db ? ; automatically takes the length of i/p
input db 256 dup('$') ; +1 of maxchar  for carriage return
 
.code

mov ax, @data
mov ds, ax

mov ah, 0ah  ; to take i/p
mov dx, paralist
int 21h

mov si, offset input  ; source index points to i/p string

loop1: inc si
cmp [si], '$'
je completed
jmp loop1   ; si points to $ after CRET

completed: dec si     ; two times one for $, one for CRET
dec si

mov ah, 09h ; prints(string) new line with carriage return, to check without carriage return remove 13 from "newline"
mov dx, offset newline
int 21h



mov cl, length ; as loop keyword uses cx register for loops we define number of iterations cx= ch+cl
mov ch,00h


print: mov ah, 02h ; prints(character) 
mov dl, [si]
int 21h
 
dec si
loop print      ; loops for cx times

mov ax, 4c00h
int 21h                                                                                