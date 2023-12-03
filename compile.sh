#!/bin/bash

# Absolute path of your local zmk repo
ZMK_DIR="/home/mattia/Documenti/Keyboards/firmwares/zmk/"
#"/media/mattia/data/System/Firmwares/Keyboards/zmk/"
#"/home/mattia/Documenti/Keyboards/firmwares/zmk/"

# Shield name
L_SHIELD="lucy_v02_left"
R_SHIELD="lucy_v02_right"

# Absolute path of your Twive config
CONFIG="/home/mattia/Documenti/Keyboards/layouts/Cotechino/config"

LEFT_BUILD_DIR="${L_SHIELD}"
RIGHT_BUILD_DIR="${R_SHIELD}"

# Firwmare output absolute path (no trailing /)
OUTPUT="/home/mattia/Documenti/Keyboards/firmwares/Lucy v0.2/Cotechino"
#"/media/mattia/data/System/Firmwares/Keyboards/Lucy v0.2/Cotechino"
#"/home/mattia/Documenti/Keyboards/firmwares/Lucy v0.2/Cotechino"


cd "$ZMK_DIR"

source zephyr/zephyr-env.sh

cd app

west build -p -d build/$LEFT_BUILD_DIR -b nice_nano_v2 -- -DSHIELD=$L_SHIELD -DZMK_CONFIG=$CONFIG \
&& mv build/$LEFT_BUILD_DIR/zephyr/zmk.uf2 "$OUTPUT/left.uf2" \
&& west build -p -d build/$RIGHT_BUILD_DIR -b nice_nano_v2 -- -DSHIELD=$R_SHIELD -DZMK_CONFIG=$CONFIG \
&& mv build/$RIGHT_BUILD_DIR/zephyr/zmk.uf2 "$OUTPUT/right.uf2"

# For QMK
#cd /home/mattia/Documenti/Keyboards/firmwares/qmk_firmware
#qmk flash -kb ferris/sweep -km cotechino
