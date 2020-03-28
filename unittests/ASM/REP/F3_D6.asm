%ifdef CONFIG
{
  "RegData": {
    "MM0":  ["0x4142434445464748", "0x0"],
    "XMM0": ["0x4142434445464748", "0x0"]
  },
  "MemoryRegions": {
    "0x100000000": "4096"
  }
}
%endif

mov rdx, 0xe0000000

mov rax, 0x4142434445464748
mov [rdx + 8 * 0], rax
mov rax, 0x5152535455565758
mov [rdx + 8 * 1], rax

mov rax, 0x6162636465666768
mov [rdx + 8 * 2], rax
mov rax, 0x7172737475767778
mov [rdx + 8 * 3], rax

mov rax, 0x0
mov [rdx + 8 * 4], rax
mov [rdx + 8 * 5], rax

movaps xmm0, [rdx + 8 * 2]
movq mm0, [rdx + 8 * 0]

movq2dq xmm0, mm0

hlt
