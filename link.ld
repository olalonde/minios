ENTRY(loader)

SECTIONS {
  . = 1M;               /* the code should be loaded at 1 MB */

  .text : ALIGN (4K)    /* align at 4 KB */
  {
    *(.text)            /* all text sections from all files */
  }

  .rodata : ALIGN (4K)  /* align at 4 KB */
  {
    *(.rodata)          /* all read-only data sections from all files */
  }

  .data : ALIGN (4K)    /* align at 4 KB */
  {
    *(.data)            /* all data sections from all files */
  }

  .bss : ALIGN (4K)     /* align at 4 KB */
  {
    *(COMMON)           /* all COMMON sections from all files */
    *(.bss)             /* all bss sections from all files */
  }
}
