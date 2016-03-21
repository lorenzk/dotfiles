#!/bin/sh
PWD=$(pwd)
for x in bash*; do ln -fs $PWD/$x ~/.$x; done
for x in config/*; do ln -fs $PWD/$x ~/.config/; done
