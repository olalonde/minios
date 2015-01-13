#define FB_GREEN     2
#define FB_DARK_GREY 8

/** fb_write_cell:
 *  Writes a character with the given foreground and background to position i
 *  in the framebuffer.
 *
 *  @param i  The location in the framebuffer
 *  @param c  The character
 *  @param fg The foreground color
 *  @param bg The background color
 */
void fb_write_cell(unsigned int i, char c, unsigned char fg, unsigned char bg)
{
  char *fb = (char *) 0x000B8000;
  fb[i * 2] = c;
  fb[i * 2 + 1] = ((fg & 0x0F) << 4) | (bg & 0x0F);
}

/* The C function */
int kmain()
{
  fb_write_cell(0, 'H', FB_GREEN, FB_DARK_GREY);
  fb_write_cell(1, 'e', FB_GREEN, FB_DARK_GREY);
  fb_write_cell(2, 'l', FB_GREEN, FB_DARK_GREY);
  fb_write_cell(3, 'l', FB_GREEN, FB_DARK_GREY);
  fb_write_cell(4, 'o', FB_GREEN, FB_DARK_GREY);
  fb_write_cell(5, ' ', FB_GREEN, FB_DARK_GREY);
  fb_write_cell(6, 'w', FB_GREEN, FB_DARK_GREY);
  fb_write_cell(7, 'o', FB_GREEN, FB_DARK_GREY);
  fb_write_cell(8, 'r', FB_GREEN, FB_DARK_GREY);
  fb_write_cell(9, 'l', FB_GREEN, FB_DARK_GREY);
  fb_write_cell(10, 'd', FB_GREEN, FB_DARK_GREY);
  fb_write_cell(11, '!', FB_GREEN, FB_DARK_GREY);
  return 0;
}

