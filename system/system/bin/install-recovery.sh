#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:59300638505a6874e550d85461b32ffe7b7f1697; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:ef485bd564a109a1cf5d5d9b9c353a2b28af69a5 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:59300638505a6874e550d85461b32ffe7b7f1697 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
