%ifdef CONFIG
{
  "HostFeatures": ["AVX"],
  "RegData": {
    "XMM0": ["0x4142434445464748", "0x7172737475767778", "0x4142434445464748", "0x7172737475767778"],
    "XMM1": ["0x6162636465666768", "0x5152535455565758", "0x6162636465666768", "0x5152535455565758"],
    "XMM2": ["0x6162636465666768", "0x7172737475767778", "0x0000000000000000", "0x0000000000000000"],
    "XMM3": ["0x6162636465666768", "0x7172737475767778", "0x6162636465666768", "0x7172737475767778"],
    "XMM4": ["0x6162636465666768", "0x7172737475767778", "0x0000000000000000", "0x0000000000000000"],
    "XMM5": ["0x6162636465666768", "0x7172737475767778", "0x6162636465666768", "0x7172737475767778"]
  },
  "MemoryRegions": {
    "0x100000000": "4096"
  }
}
%endif

lea rdx, [rel .data]

vmovapd ymm0, [rdx]
vmovapd ymm1, [rdx + 32]

vpmaxub xmm2, xmm0, xmm1
vpmaxub ymm3, ymm0, ymm1

vpmaxub xmm4, xmm0, [rdx + 32]
vpmaxub ymm5, ymm0, [rdx + 32]

hlt

align 32
.data:
dq 0x4142434445464748
dq 0x7172737475767778
dq 0x4142434445464748
dq 0x7172737475767778

dq 0x6162636465666768
dq 0x5152535455565758
dq 0x6162636465666768
dq 0x5152535455565758
