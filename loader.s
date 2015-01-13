global loader                  ; the entry symbol for ELF
extern kmain

MAGIC_NUMBER equ 0x1BADB002    ; define the magic number constant
; https://github.com/nirs/littleosbook/commit/04a694cdcbca458e30212ca5e9b562d5954db386
FLAGS        equ 0x0           ; multiboot flags
CHECKSUM     equ -MAGIC_NUMBER ; calculate the checksum (magic number + checksum should equal 0)

;; Reserve memory for kernel stack
KERNEL_STACK_SIZE equ 4096     ; size of stack in bytes

section .bss
align 4                        ; align at 4 bytes
kernel_stack:                  ; label points to beginning of memory
    resb KERNEL_STACK_SIZE     ; reserve stack for the kernel

section .text:                 ; start of the text (code) section
align 4                        ; the code must be 4 byte aligned
dd MAGIC_NUMBER                ; write the magic number to the machine code
dd FLAGS                       ; the flags,
dd CHECKSUM                    ; and the checksum

loader:                        ; the loader label (defined as entry point in linker script)
mov eax, 0xCAFEBABE            ; place the number 0xCAFEBABE in the register eax
mov esp, kernel_stack + KERNEL_STACK_SIZE   ; point esp to the start of the
                                            ; stack (end of memory area)
call kmain
.loop:
jmp .loop                      ; loop forever
