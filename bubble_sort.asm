iclude 'emu8086.inc'

org 100h 
.data

array  db 9,6,5,4,3,2,1   ; The array to be sorted
count  dw 7               ; Number of elements in the array

.code

    mov cx,count          ; Outer loop iteration count
    dec cx                ; --cx for the outer loop (bubble sort)

nextscan:                 ; Outer loop
    mov bx,cx            ; Copy outer loop count to bx
    mov si,0             ; Initialize si to 0 (array index)

nextcomp:                 ; Inner loop for comparing elements
    mov al,array[si]     ; Load array[si] into al
    mov dl,array[si+1]   ; Load array[si+1] into dl
    cmp al,dl            ; Compare al and dl

    jnc noswap           ; If al >= dl, no swap

    ; Swap if needed
    mov array[si],dl     ; Move dl to array[si]
    mov array[si+1],al   ; Move al to array[si+1]

noswap:
    inc si               ; Increment index si
    dec bx               ; Decrease the count of comparisons left
    jnz nextcomp         ; If bx != 0, repeat inner loop

    loop nextscan        ; Decrement cx and repeat outer loop

;;; Display the sorted elements

    mov cx,7             ; Set cx to 7 for 7 elements
    mov si,0             ; Reset si to 0

print:
    mov al, array[si]    ; Load the element at array[si] into al
    add al, 30h           ; Convert it to ASCII by adding 30h
    mov ah, 0eh           ; Set video function for teletype output
    int 10h               ; Call BIOS interrupt to print the character
    mov ah, 2             ; DOS function to set cursor position
    mov dl, ' '           ; Print a space
    int 21h               ; Call DOS interrupt to output space
    inc si                ; Increment the index
    loop print            ; Repeat for all elements

    ; Optionally, print a newline at the end
    mov ah, 2
    mov dl, 0Ah           ; Newline
    int 21h
    mov dl, 0Dh           ; Carriage return
    int 21h

    ret                   ; Return from the program
