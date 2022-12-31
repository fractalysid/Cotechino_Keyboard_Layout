#!/bin/bash

# Absolute path of your local zmk repo
ZMK_DIR="~/zmk/"

# Shield name
L_SHIELD="lucy_v02_left"
R_SHIELD="lucy_v02_right"

# Absolute path of your Twive config
CONFIG="~/twive/config"

LEFT_BUILD_DIR="${SHIELD}_left"
RIGHT_BUILD_DIR="${SHIELD}_right"

# Firwmare output absolute path (no trailing /)
OUTPUT="~/twive"


cd $ZMK_DIR

source zephyr/zephyr-env.sh

cd app

west build -p -d build/$LEFT_BUILD_DIR -b nice_nano_v2 -- -DSHIELD=$L_SHIELD -DZMK_CONFIG=$CONFIG \
&& mv build/$LEFT_BUILD_DIR/zephyr/zmk.uf2 "$OUTPUT/left.uf2" \
&& west build -p -d build/$RIGHT_BUILD_DIR -b nice_nano_v2 -- -DSHIELD=$R_SHIELD -DZMK_CONFIG=$CONFIG \
&& mv build/$RIGHT_BUILD_DIR/zephyr/zmk.uf2 "$OUTPUT/right.uf2"

