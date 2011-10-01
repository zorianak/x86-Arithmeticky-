title Integer Arithmetic Program	(arith.asm)

; This program is an example of additions"
.model small
.stack 100h
.data
		db 'iiii'
	y DW ?
		db 'mmmm'
	Year DW 2011d
		db 'nnnn'
	week DW ?
		db 'oooo'
	sum DW ?
		db 'pppp'
	

.code
main proc
	mov ax,@data
	mov ds,ax
	
	;now we are going to attempt to subtract 1 from year
	mov ax,1d
	mov bx, Year
	mov cx, y
	
	;Year - 1
	sub bx,ax
	;so now Year  - 1 is now being stored in bx, we need to set y
	;to equal what's in bx
	mov y,bx
	
	;now to do the expression 36 + Y + (Y/4) + (y/100)
	;cx contains 2010
	mov ax,36d
	
	;add 36 to Y
	add ax,y
	;start building the sum.  Make sum = 36 + y
	mov sum,ax
	
	;now we are going to divide, fun times!
	;y/4
	mov ax,y
	mov bx,4d
	mov dx,0
	div bx
	;add bx to the sum we've already gotten
	add sum,ax
	
	;dividing again
	;y/100
	mov ax,y
	mov bx,100d
	mov dx,0d
	div bx
	;add bx to sum that's already being worked on
	add sum,ax
	
	;now mod division between sum and 7 and then addign one adn assigning it to week
	;divide sum by 7
	mov ax,sum
	mov bx,7d
	mov dx,0d
	div bx
	;now we will add 1 to that
	mov ax,1d
	;adds sum/7 + 1
	add ax,dx
	mov week,ax
	
	;wrapper to closer the programs
	mov ax,4C00h
	int 21h
main endp
end main