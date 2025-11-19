;---------------------------------------------
; Name: Pyae Phyo Paing
; Date: October 14, 2025
; Program: Assignment 3
; Description:
;   This program asks the user for num1, num2, and num3,
;   computes ((num1^3)*num2 + 5*(num2^2)) / num3,
;   and displays both the quotient and remainder.
;---------------------------------------------
; Sample Run 1:
; num1 = 1
; num2 = 2
; num3 = 3
; ((1^3)*2 + 5*(2^2)) / 3 = 7 R 1
;
; Sample Run 2:
; num1 = 4
; num2 = 6
; num3 = 9
; ((4^3)*6 + 5*(6^2)) / 9 = 62 R 6
;---------------------------------------------

INCLUDE Irvine32.inc

.data
num1       DWORD ?
num2       DWORD ?
num3       DWORD ?
result     DWORD ?
remainder  DWORD ?

prompt1    BYTE "Enter num1: ",0
prompt2    BYTE "Enter num2: ",0
prompt3    BYTE "Enter num3: ",0
msgResult  BYTE "Result (quotient) = ",0
msgRem     BYTE "Remainder = ",0

.code
main PROC

    ;--- Input section ---
    mov  edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov  num1, eax

    mov  edx, OFFSET prompt2
    call WriteString
    call ReadInt
    mov  num2, eax

    mov  edx, OFFSET prompt3
    call WriteString
    call ReadInt
    mov  num3, eax

    ;--- Calculation section ---
    ; Compute (num1 ^ 3)
    mov  eax, num1
    imul eax, num1
    imul eax, num1            ; eax = num1^3
    mov  ebx, num2
    imul eax, ebx             ; eax = num1^3 * num2
    mov  ecx, eax             ; store in ecx

    ; Compute 5 * (num2 ^ 2)
    mov  eax, num2
    imul eax, num2
    imul eax, 5
    add  ecx, eax             ; ecx = numerator

    ; Divide by num3
    mov  eax, ecx
    cdq
    idiv num3                 ; eax=quotient, edx=remainder
    mov  result, eax
    mov  remainder, edx

    ;--- Output section ---
    mov  edx, OFFSET msgResult
    call WriteString
    mov  eax, result
    call WriteDec
    call Crlf

    mov  edx, OFFSET msgRem
    call WriteString
    mov  eax, remainder
    call WriteDec
    call Crlf

    exit
main ENDP
END main
