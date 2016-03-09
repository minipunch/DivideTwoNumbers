TITLE      (.asm)

; A3 - DIVIDE TWO NUMBERS
; DATE: 3/8/16

Include Irvine32.inc

.data

msg1 BYTE "Enter first number: ",0
msg2 BYTE "Enter second number: ",0
msg3 BYTE "Result: ",0
num1 SDWORD ?
num2 DWORD ?
quotient DWORD ?

.code

main PROC
	
	mov ebx, 0				; zero out EBX
	
inputNum1:
	mov eax, 0				; zero out EAX
	mov edx, OFFSET msg1			
	call WriteString			; display msg1
	call ReadInt				; read input
	call checkInput				; validate input
	cmp ebx, 1				; check if the ebx is set to one or "invalid"
	je inputNum1				; re input number if input was invalid
	mov num1, eax				; set the validated number into num1
inputNum2:	
	mov eax, 0
	mov edx, OFFSET msg2
	call WriteString			; display msg2
	call ReadInt				; read input
	call checkInput				; validate input
	cmp ebx, 1				; check if the EBX is set to one or "invalid"
	je inputNum2				; re input number if input was invalid
	mov num2, eax				; set the validated number into num2
	
	mov eax, num1				; set EAX parameter for DivideNums
	mov ebx, num2				; set EBX parameter for DivideNums
	call DivideNums				; divide numbers. Quotient returned in EBX. Remainder returned in ECX.
	call RoundUp
	call DumpRegs
	exit
	
main ENDP

;-----------------------------------------------------
; this function receives the EAX as the input number
; checks for range between 0 and 200
; returns 1 in the ebx if something is wrong
; returns 0 in the ebx if everything was valid
;-----------------------------------------------------
checkInput PROC
	cmp eax, 0
	jle endd
	cmp eax, 200
	jg endd
	mov ebx, 0
	ret
	
endd:
	mov ebx, 1
	ret
checkInput ENDP
;----------------------------------------------------

;-----------------------------------------------------
; this function receives num1 in the EAX and num2 in the EBX
; quotient held in EDX
; Any remainder is held in the ECX
;-----------------------------------------------------
DivideNums PROC
	mov edx, 0			; zero out edx
startDivision:
	sub eax, ebx			; subtract first num from second
	mov ecx, eax			; move num1 into the ECX
	cmp ecx, 0			; compare ECX with 0
	jl returnn
	inc edx				; increment the quotient count
	jmp startDivision
	
returnn:
	add ecx, num2
	;mov eax, 
	ret
DivideNums ENDP
;----------------------------------------------------

;-----------------------------------------------------
; 
; this function determines whether a quotient should be rounded or not
; takes in the ecx as the remainder and ebx as num2
; takes in edx as the quotient
; returns final quotient in edx
;-----------------------------------------------------
RoundUp PROC
	
	ret
	
	
RoundUp ENDP
;----------------------------------------------------
END main