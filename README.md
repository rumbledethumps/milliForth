# A milliForth for Picocomputer 6502

Picocomputer 6502: https://picocomputer.github.io/

Look upstream for more info: https://github.com/agsb/milliForth-6502

Note that this port uses Picocomputer STDIN. The milliForth docs mention a lack of support for even backspace, but you will have full line editing on a Picocomputer.

I'm able to run `my_hello_world.FORTH` by pasting it through minicom with a 500ms newline tx delay.

To update `sector-6502.s` do two things.

1. Comment out the implementations of getchar, putchar, and byes. Replace with: `.import getchar, putchar, byes`

2. Make sure that `tib_end = $50` is still $50. Currently, milliForth doesn't use this, but the Picocomputer STDIN can be adjusted to make this buffer safe regardless.
