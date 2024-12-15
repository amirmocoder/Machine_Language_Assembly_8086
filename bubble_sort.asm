org 100h 
.data

array  db 9,6,5,4,3,2,1  
length  dw 7

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

    mov cx,length
    mov si,0

print:
    mov al, array[si]
    add al, 30h
    mov ah, 0eh
    int 10h

    mov al, ' '
    int 10h

    inc si
    loop print

    ret