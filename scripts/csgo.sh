sudo systemctl start tuned

sudo tuned-adm profile throughput-performance

nvidia-settings -a [gpu:0]/GpuPowerMizerMode=1

gamemoded -r
