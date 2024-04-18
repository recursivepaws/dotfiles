PERCENT=$(cat /sys/class/hwmon/hwmon2/device/gpu_busy_percent)
T1=$(cat /sys/class/hwmon/hwmon2/temp1_input)
T2=$(cat /sys/class/hwmon/hwmon2/temp2_input)
T3=$(cat /sys/class/hwmon/hwmon2/temp3_input)
AVG=$(expr $T1 + $T2 + $T3)
AVG=$(expr $AVG / 3 / 1000)

echo $PERCENT% $AVG°C
