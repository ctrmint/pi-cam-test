!#/bin/bash
# Set up some vars
# Test Pi Zero camera streaming options.

TIMER=0             # zero value, run indefinately.
WIDTH=800           # display width
HEIGHT=400          # display height
FPS=12              # frames per second
PORT=8160           # tcp port
ENCODING="h264"     # encoding

raspivid -o - -t $TIMER -n -w $WIDTH -h $HEIGHT -fps $FPS | cvlc -vvv stream:///dev/stdin --sout '#rtp{sdp=rtsp://:$PORT/}' :demux=$ENCODING
