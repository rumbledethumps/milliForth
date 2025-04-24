.include "rp6502.inc"
.export getchar, putchar, byes

; this must match milliForth tib size
tib_end = $50
STDIN_STR_LEN = tib_end - 1

init:
    lda #STDIN_STR_LEN
    sta RIA_A
    lda #RIA_OP_STDIN_OPT
    sta RIA_OP ; int stdin_opt(unsigned long ctrl_bits, unsigned char str_length)
init_busy:
    bit RIA_BUSY
    bmi init_busy
    lda #0
    sta getchar+1 ; self modify bra to stop calling init
    ; jmp getchar

getchar:
    bra init
    lda #1 ; get 1 char
    sta RIA_XSTACK
    lda #0 ; STDIN
    sta RIA_A
    lda #RIA_OP_READ_XSTACK
    sta RIA_OP ; int read_xstack(void *buf, unsigned count, int fildes)
getchar_busy:
    bit RIA_BUSY
    bmi getchar_busy
    lda RIA_XSTACK
    clc ; because milliForth expects
    rts

putchar:
    sta RIA_XSTACK
    lda #1 ; STDOUT
    sta RIA_A
    lda #RIA_OP_WRITE_XSTACK
    sta RIA_OP ; int write_xstack(const void *buf, unsigned count, int fildes)
putchar_busy:
    bit RIA_BUSY
    bmi putchar_busy
    clc ; because milliForth expects
    rts

byes:
    lda #RIA_OP_EXIT
    sta RIA_OP
