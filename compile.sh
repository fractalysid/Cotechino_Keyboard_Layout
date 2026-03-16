#!/bin/bash

# Absolute path of your local zmk repo
ZMK_DIR="/mnt/data/projects/electronics/firmwares/keyboards/zmk"
BOARD_NAME="nice_nano"
#"/media/mattia/data/System/Firmwares/Keyboards/zmk/"
#"/home/mattia/Documenti/Keyboards/firmwares/zmk/"

# Shield name
L_SHIELD="lucy_v02_left"
R_SHIELD="lucy_v02_right"

# Absolute path of your Twive config
CONFIG="/mnt/data/projects/electronics/Keyboards/layouts/Cotechino/config"

LEFT_BUILD_DIR="${L_SHIELD}"
RIGHT_BUILD_DIR="${R_SHIELD}"

# Firwmare output absolute path (no trailing /)
OUTPUT="/mnt/data/projects/electronics/firmwares/keyboards/Lucy_v0.2/Cotechino"

cd "$ZMK_DIR"

source .venv/bin/activate
#source zephyr/zephyr-env.sh

cd app

#export ZEPHYR_SDK_INSTALL_DIR=/opt/zephyr-sdk-0.14.2
#export ZEPHYR_TOOLCHAIN_VARIANT=zephyr

# Per compilare il firmware di reset delle impostazioni BT
#west build -p -b $BOARD_NAME -d build/$LEFT_BUILD_DIR -- -DDTC_OVERLAY_FILE="" -DDTC=$(which dtc) -DSHIELD=settings_reset -DZMK_CONFIG=$CONFIG -DZEPHYR_TOOLCHAIN_VARIANT=zephyr -DZEPHYR_SDK_INSTALL_DIR=/opt/zephyr-sdk-0.16.4
#exit

#west build -p -b $BOARD_NAME -d build/$LEFT_BUILD_DIR -- -DDTC_OVERLAY_FILE="" -DDTC=$(which dtc) -DSHIELD=$L_SHIELD -DZMK_CONFIG=$CONFIG -DZEPHYR_TOOLCHAIN_VARIANT=zephyr -DZEPHYR_SDK_INSTALL_DIR=/opt/zephyr-sdk-0.14.2 \
west build -p -b $BOARD_NAME -d build/$LEFT_BUILD_DIR -- -DDTC_OVERLAY_FILE="" -DDTC=$(which dtc) -DSHIELD=$L_SHIELD -DZMK_CONFIG=$CONFIG -DZEPHYR_TOOLCHAIN_VARIANT=zephyr -DZEPHYR_SDK_INSTALL_DIR=/opt/zephyr-sdk-0.16.4 \
&& mv build/$LEFT_BUILD_DIR/zephyr/zmk.uf2 "$OUTPUT/left.uf2" \
&& west build -p -b $BOARD_NAME -d build/$RIGHT_BUILD_DIR -- -DDTC_OVERLAY_FILE="" -DDTC=$(which dtc) -DSHIELD=$R_SHIELD -DZMK_CONFIG=$CONFIG -DZEPHYR_TOOLCHAIN_VARIANT=zephyr -DZEPHYR_SDK_INSTALL_DIR=/opt/zephyr-sdk-0.16.4 \
&& mv build/$RIGHT_BUILD_DIR/zephyr/zmk.uf2 "$OUTPUT/right.uf2"

# For QMK
#cd /home/mattia/Documenti/Keyboards/firmwares/qmk_firmware
#qmk flash -kb ferris/sweep -km cotechino
