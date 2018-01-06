# Qualcomm Snapdragon CLANG
ifneq ($(HOST_OS),darwin)
SDCLANG := true
SDCLANG_PATH := prebuilts/clang/host/linux-x86/clang-4053586/bin
SDCLANG_LTO_DEFS := device/qcom/common/dllvm-lto-defs.mk
endif

