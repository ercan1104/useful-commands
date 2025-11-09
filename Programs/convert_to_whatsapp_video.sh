#!/bin/sh
ffmpeg -i input.mp4 -c:v libx264 -vf "scale=640:-2" -c:a aac -b:a 128k -movflags +faststart output.mp4
