#/bin/bash

amount=$1

if test -f /home/asif/.config/mvolume.txt; then
    current_amt="$(awk 'NR==1' '/home/asif/.config/mvolume.txt')"
else
    touch /home/asif/.config/mvolume.txt
    echo 0 > /home/asif/.config/mvolume.txt
    current_amt=0
fi

new_val=$((current_amt + amount))

if [ $new_val -ge 100 ]; then
    new_val=100
elif [ $new_val -le 0 ]; then
    new_val=0
fi

echo $new_val

pactl set-sink-volume 0 $new_val%
echo $new_val > /home/asif/.config/mvolume.txt
