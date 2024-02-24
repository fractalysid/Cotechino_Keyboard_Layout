# Cotechino Layout
After months of experimentation, Cotechino has emerged as the offspring of the [Twive family layouts](https://github.com/fractalysid/Twive_Layouts).

I initiated the development of this layout towards the end of the year 2022. Initially, lacking inspiration for a name, I temporarily dubbed it after the "cotechino", an Italian dish typically enjoyed on New Year's Eve. Presently, my inspiration and motivation for finding a more suitable name are even scarcer, sooo...

# Firmwares
ZMK and QMK files are provided.

ZMK for [Lucy](https://github.com/fractalysid/Lucy-Keyboard)

QMK for [Ferris Sweep](https://github.com/davidphilipbarr/Sweep)

## Core principles

- Key Layout:
  - Total of 34 keys.
  - 2 keys thumb cluster with priority given to the inner key.
    - everything you need to type ordinary text is available using only the inner thumb key
    - outer thumb key is reserved for extra layers

- Base Layout:
  - Colemak-DH layout.

- Specific Keys:
  - Right thumb: Space.
  - Left thumb: Return.
  - Bottom left pinky: Apostrophe (to be swapped with another common symbol or letter).

- Backspace:
  - Accessible (almost always) from the top left pinky.

- Modifiers:
  - Located on the bottom row, mirrored from left to right: SHIFT, CTRL, ALT, GUI.
  - Sticky version available

- Utility and Navigation Layer:
  - Right thumb: For keys like GUI, TAB, ESC, sticky modifiers, and navigation keys.

- Symbols Layer:
  - Left thumb key, no use of SHIFT, every symbol has it's own key
  - Parentheses share the same key, making use of _tap-dance_
  - Currencies share the same key, making use of _tap-dance_

- Combo Usage:
  - Avoid except for escaping to other layers.

- Prefer more layers and avoid using keys in difficult positions.

- Dedicated Layers:
  - Keyboard: Bluetooth device selection, reset, bootloader mode, etc.
  - Media and NUMPAD keys.
  - Extra layer for macros and accessing additional layers like (almost) standard QWERTY, gaming layer, US layout Colemak-DH.

### Details about layers and modifiers triggering
- Bottom row modifier: Positional hold-tap, "tap-preferred" with 165ms tapping term
- Utility layer: default layer-toggle timings
- Common layer: "Balanced" with only 125ms tapping term for quick access while typing text

# The Layout

![Cotechino Layout](https://github.com/fractalysid/Cotechino_Keyboard_Layout/blob/main/Cotechino.png?raw=true)
