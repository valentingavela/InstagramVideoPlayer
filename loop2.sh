#!/usr/bin/env bash
 #export INFOBEAMER_BLANK_MODE=console
echo "23" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio23/direction
while true
do
    movimiento=$(cat /sys/class/gpio/gpio23/value)
    if [ $movimiento -eq 1 ]
    then
    sleep 0.1
    movimiento=$(cat /sys/class/gpio/gpio23/value)
        if [ $movimiento -eq 1 ]
	then
	    #echo $(date) " mov" > /home/pi/movimiento.log
            #kill -9 $(pidof fbi)
	    sleep 2
            perl /home/pi/videoplayer.pl > /dev/null 2>&1 &
            sleep 25
            #killall info-beamer &&
            kill -9 $(pidof fbi)
            killall mplayer
            killall omxplayer.bin
            fbi -T 2 -d /dev/fb0 -noverbose -a /home/pi/motor/black.jpg
            fbi -T 1 -d /dev/fb0 -noverbose -a /home/pi/motor/black.jpg
            kill -9 $(pidof fbi)
            rm -rf /mnt/ramdisk/*
            #dd if=/dev/zero of=/dev/fb0
            sleep 5
	fi
    #else
    #    echo ""
    fi
sleep 0.2
done
