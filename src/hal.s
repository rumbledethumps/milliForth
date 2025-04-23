.include "rp6502.inc"
.export getchar, putchar, byes

getchar:
    bit RIA_READY
    bvc getchar
    lda RIA_RX

putchar:
    bit RIA_READY
    bpl putchar
    sta RIA_TX
    rts

byes:
    lda #RIA_OP_EXIT
    sta RIA_OP
