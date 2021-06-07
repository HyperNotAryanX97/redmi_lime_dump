#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:d5fc409d8797431e8e74b1348e64399263ba0be9; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:8186651ee9aa647a6c1d699a5515adc53d8fdb00 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:d5fc409d8797431e8e74b1348e64399263ba0be9 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
