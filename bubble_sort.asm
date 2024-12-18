org 100h

.model small
.stack 100h
 
.data

array  db 1,40,2,3 
length  dw 4

.code   

    mov cx,length
    dec cx               
iteronarray:     
    mov bx,cx  
    mov si,0

cmponarray: 
    mov al,array[si]   
    mov dl,array[si+1] 
    cmp al,dl            

    jnc noswap           
    mov array[si],dl
    mov array[si+1],al
    
noswap:
    inc si   

    dec bx 
    jnz cmponarray

    loop iteronarray

    mov di,length
    mov si,0   


;; notice: this code is for resualt output/printing purposes only and is not part of the main program or algorithm
print:
    mov ax, @data
    mov ds, ax
    
    mov dh, 0      
    mov dl, array[si]
    mov ax, dx

    mov cx, 0
    mov dx, 0

count_digit:
    cmp ax, 0
    je print_digit

    mov bx, 10
    div bx
    push dx
    inc cx
    xor dx, dx
    jmp count_digit

print_digit:
    cmp cx, 0
    je exit

    pop dx
    add dl, 48
    mov ah, 02H    
    int 21H           
    dec cx              
    jmp print_digit  

exit:
    mov ah, 02H  
    mov dl, ' '     
    int 21H

    inc si             
    dec di
    
    jnz print       

    ret

