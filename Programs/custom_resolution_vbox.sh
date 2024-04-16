#!/bin/sh
read name
vboxmanage controlvm $name setvideomodehint 1920 1080 32