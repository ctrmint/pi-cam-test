#!/bin/bash
# Set up some vars
# Test Pi Zero camera streaming options.

TIMER=0             # zero value, run indefinately.
WIDTH=640           # display width
HEIGHT=480          # display height
FPS=25              # frames per second, more frames per second more cpu time.
PORT=8554           # tcp port
ENCODING="h264"     # encoding
BITRATE=1000000     # bitrate of stream, greater the rate, greater the cpu hit.
FILENAME="birdbox"  # filename is required on url, eg rtsp://192.168.0.8:8554/birdbox

raspivid -o - -t $TIMER -w $WIDTH -h $HEIGHT -fps $FPS -ih -pf baseline -k -b $BITRATE -n | \
        cvlc -A-vvv alsa,none -v stream:///dev/stdin --sout '#rtp{sdp=rtsp://:'$PORT'/'$FILENAME'}' :demux=h264
