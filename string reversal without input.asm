.model small
.stack 100h
                                                        
.data
   
string db 'Pokhara University', '$' 
length db 19
 
.code

mov ax, @data
mov ds, ax


mov si, offset string  ; source index points to i/p string

loop1: inc si
cmp [si], '$'
je completed
jmp loop1

completed: dec si 


mov cl, length ; as loop keyword uses cx register for loops we define number of iterations cx= ch+cl
mov ch,00h


print: mov ah, 02h ; prints(character)
mov dl, [si]
int 21h
 
dec si
loop print      ; loops for cx times

mov ax, 4c00h
int 21h                                                                                