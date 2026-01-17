#!/bin/bash

pics=("$HOME/Pictures"/*)
x=$1

feh --bg-center "${pics[$x]}"

