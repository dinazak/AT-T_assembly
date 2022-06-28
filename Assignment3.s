.section .data
input1: .asciz "%d"
input2: .asciz "%f"
ecxPrint: .asciz "The ecx is : %d\n"
outsum: .asciz "The sum is: %f\n"
outavg: .asciz "The average is: %f\n"
output: .asciz "The sum is: %f\n"
n: .int 0
num: .double 0.0
sum: .double 0.0
avg: .double 0.0

.section .text

.globl _main

_main:
    pushl $n
    pushl $input1
    call _scanf 
    add $8, %esp

    movl n, %ecx
    
loop1:

    pushl %ecx
    #pushl %ebx

    pushl $num
    add $4, %ebx
    pushl %ebx
    pushl $input2
    call _scanf
    add $12, %esp
    movl $num, %ebx

    #popl %ebx
    popl %ecx

    fldl sum
    faddl num
    fstpl sum

    loop loop1 

    
    movl $sum , %ebx

    pushl %ebx
    add $4, %ebx
    pushl %ebx
    pushl $output
    call _printf
    add $12, %esp

    ret