        .global main
        .text
        .align  2

main:   stp     x29, x30, [sp, -16]!
        mov     x8, 172                 // getpid on ARM64
        svc     0                       // trap to EL1
        mov     w1, w0
        ldr     x0, =fmt
        bl      printf
        ldp     x29, x30, [sp], 16
        mov     w0, wzr
        ret

        .data
fmt:    .asciz  "Greetings from: %d\n"

        .end
