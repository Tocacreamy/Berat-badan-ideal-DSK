.model small 
org 100h
.code


start: 
   
    
    jmp one 
    
    ar db 0,1,2,3,4,5,6,7,8,9
    ;judul
    head db '========PROGRAM PERHITUNGAN BADAN IDEAL========$' 
    head2 db 10,13,9, 'berapa sih berat badan idealku? $'
 
    spac db 10,13,' $'
     
    kelamin db 10,13, '1.pria $'
    kelamin2 db 10,13,'2.wamita $'
    pil db 10,13,'Pilih jenis kelamin: $'
    phil db ?
    
    laki db '=======pria======= $'
    prm db '=======wanita======= $'
    wrong db 'PILIHAN SALAH!$'
    tinggi db 10,13,'masukkan tinggi badan (cm): $'
    ting db ' cm$'
    
    mohon db 10,13,'*Mohon masukkan tinggi diatas 130 cm ya^^$' 
    rks db 10,13,'*Mungkin kamu adalah manusia tertinggi di dunia O_O$'
    hsl db 'Berat ideal kamu adalah $'
    strp db 10,13,'---------------------------$'
    
    lbih db 10,13,'* Minum susu dan tidur yang cukup$' 
    lbih2 db 10,13,'  bantu kamu tumbuh lebih tinggi lagi:)$'
    ;out
    co1 db 30h
    co2 db 30h
    
    hssl db ' kg$'
    peng db ?
    peng1 db ?
    pro db 0h
    
    bck db 10,13,'kembali ke menu?(y/n): $'
    thks db '                                TERIMAKASIH^^$'
    made db 10,13,'        made by zeko$'
    ;input
    in3 db ?
    in1 db ?
    in2 db ?
lup:

    
    mov ah,09h 
    lea dx,spac
    int 21h
    
    mov ah,09h 
    lea dx,spac
    int 21h        
    
one:
    mov ah,09h 
    mov bx,1010b
    mov cx,31h
    int 10h
    
    mov ah,09h
    mov dx,offset head 
    int 21h 

    
two: 

    mov ah,09h
    mov dx,offset head2
    int 21h
     
three:
    mov ah,09h 
    mov dx,offset spac
    int 21h 

    
for:
    mov ah,09h
    mov dx,offset kelamin
    int 21h 
    
    mov ah,09h
    mov dx,offset kelamin2
    int 21h 
    
    mov ah,09h
    lea dx,pil
    int 21h
     
pilkelamin:
    mov ah,1
    int 21h
    
    mov bh,al
    sub bh,48
    cmp bh,ar[2]
    mov phil,bh
    jz pr 
    jc lk
    
    
tdk:
    mov ah,09h 
    lea dx,spac
    int 21h
     
    mov ah,09h
    mov bx,1100b
    mov cx,0eh
    int 10h
    
    mov ah,09h
    mov dx,offset wrong
    int 21h
    
    jmp endd
    
pr:
    mov ah,09h 
    lea dx,spac
    int 21h 
     
    mov ah,09h
    mov bx,1101b
    mov cx,14h
    int 10h
    
    mov ah,09h 
    lea dx,prm
    int 21h 
    
    mov pro,03h  
    ;inputan 
    
    mov ah,09h
    lea dx,tinggi
    int 21h  
    
    mov ah,01h          
    int 21h
    mov dl,al
    mov in3,dl
    
    mov ah,01h          
    int 21h
    mov dl,al
    mov in1,dl
    
    mov ah,01h          
    int 21h
    mov dl,al
    mov in2,dl
    
    mov ah,09h
    lea dx,ting
    int 21h
     
    jmp hitung

    
    
lk:
    mov ah,09h 
    lea dx,spac
    int 21h 
     
    mov ah,09h
    mov bx,1011b
    mov cx,12h
    int 10h
    
    mov ah,09h 
    lea dx,laki
    int 21h   
    
    mov  pro,00h
    ;inputan
    
    mov ah,09h
    lea dx,tinggi
    int 21h
    
    mov ah,01h          
    int 21h
    mov dl,al
    mov in3,dl
       
    mov ah,01h          
    int 21h
    mov dl,al
    mov in1,dl
    
    mov ah,01h          
    int 21h
    mov dl,al
    mov in2,dl
    
    mov ah,09h
    lea dx,ting
    int 21h
    
    jmp hitung
    
hitung: 
    
    mov bh,in1
    sub bh,48
     
    mov peng,09h
    cmp bh,ar[9] 
    jz hs
    
    dec peng
    cmp bh,ar[8] 
    jz hs
    
    dec peng
    cmp bh,ar[7] 
    jz hs
    
    dec peng
    cmp bh,ar[6] 
    jz hs
    
    dec peng
    cmp bh,ar[5] 
    jz hs
    
    dec peng
    cmp bh,ar[4] 
    jz hs
    
    dec peng
    cmp bh,ar[3] 
    jz hs
 ;======================   
    dec peng
    cmp bh,ar[2] 
    jz hc

    dec peng
    cmp bh,ar[1] 
    jz hc
    
    dec peng
    cmp bh,ar[0] 
    jz hc
hc:    
    mov bh,in3
    sub bh,48
    
    cmp bh,ar[2]
    mov in3,bh
    mov bh,in1 
    jc non

    ;==========================      
non:
    
    mov ah,09h 
    lea dx,spac
    int 21h
    
    mov ah,09h 
    mov bx,1110b
    mov cx,41
    int 10h
    
    mov ah,09h 
    lea dx,mohon
    int 21h
    
    jmp endd
           
hs: 
 
    mov bl,bh
    mov dl,bl
    add dl,48
    mov in1,dl
    
    
hsu7:
    mov dl,pro
    add peng,dl
           
    mov bh,in2
    sub bh,48
    cmp bh,peng
    jc kurg
    
    mov bl,bh
    mov dl,bl
    sub dl,peng
    add dl,48
    mov in2,dl 
    
    jmp hasil
    
kurg:

    dec in1
    
    mov bl,bh
    mov dl,bl
    add dl,10
    sub dl,peng
    add dl,48
    mov in2,dl    
    jmp hasil 

    
hasil:
    mov ah,09h 
    lea dx,spac
    int 21h 
    
    mov ah,09h 
    lea dx,strp
    int 21h
    
    mov ah,09h 
    lea dx,spac
    int 21h 

    mov ah,09h 
    lea dx,spac
    int 21h 
        
    mov ah,09h 
    mov bx,10011011b
    mov cx,30
    int 10h
    
    mov ah,09h 
    lea dx,hsl
    int 21h
    
    mov dl,in3
    dec dl
    mov ah,02
    int 21h 
    
    mov dl,in1
    mov ah,02
    int 21h
    
    mov dl,in2
    mov ah,02
    int 21h 
                     
    mov ah,09h 
    lea dx,hssl
    int 21h
    
    mov ah,09h 
    lea dx,spac
    int 21h
    
    mov ah,09h 
    lea dx,strp
    int 21h 
  
dun:
    mov bh,in3
    sub bh,48
    cmp bh,ar[2]
    jc tum
    
    mov ah,09h 
    lea dx,rks
    int 21h
    jmp endd
tum:
    mov bh,phil
    sub bh,48
    cmp bh,ar[1]
    jz pluz
    jmp pliz
pluz:
    mov bh,in1
    dec bh
    mov in1,bh 
pliz:             ;=====rev
    mov bh,in1
    sub bh,48
    cmp bh,ar[4]
    jc heh
    jmp endd
heh:     
    mov ah,09h 
    lea dx,lbih
    int 21h
    
    mov ah,09h 
    lea dx,lbih2
    int 21h         
endd:
    mov ah,09h 
    lea dx,spac
    int 21h
    
    mov ah,09h 
    lea dx,bck
    int 21h
    
    mov ah,01h
    int 21h
    
    cmp al,79h
    jz lup
    
    mov ah,06
    mov al,00
    mov bh,07
    mov ch,00
    mov cl,00
    mov dh,24
    mov dl,79
    int 10h
    
    mov ah,09h 
    lea dx,spac
    int 21h
    int 21h
    
    mov ah,09h 
    mov bx,1010b
    mov cx,45
    int 10h
    
    mov ah,09h 
    lea dx,thks
    int 21h 
    
    ;mov ah,09h 
    ;lea dx,made
    ;int 21h 
    
    mov ah,09h 
    lea dx,spac
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h 
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
          
end start