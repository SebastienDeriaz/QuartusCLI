# QuartusCLI

Quartus CLI test project to flash a simple test program using command line tools in a De1-Soc

- Numbers 0 to 5 are showed on the HEX display
- Leds (LEDR0 to LEDR3) light up when push buttons (KEY0 to KEY3) are pressed


## Installation

### With Nix


### Without Nix

1) Install quartus prime lite (tools ``quartus_sh`` and ``quartus_pgm``)

## Scripts

| Script                         | Description                             |
|--------------------------------|-----------------------------------------|
| ``build.sh``                   | Generate ``.sof`` file from ``top.vhd`` |
| ``flash.sh``                   | Flash the ``.sof`` into the FPGA        |
| ``init_usbblaster_drivers.sh`` | Allow user access to the usb blaster    |

## Files

| File                           | Description                                        |
|--------------------------------|----------------------------------------------------|
| ``QuartusCLI.qpf``             | Prime Project File (project version, date, etc...) |
| ``QuartusCLI.qsf``             | Prime Settings File (settings, FPGA type, etc...)  |
| ``pin_assignment_DE1_SoC.tcl`` | Pin assignements                                   |
| ``src/top.vhd``                    | Top-level file                                     |

## Problems

If the FPGA cannot be flashed, try running the ``init_usbblaster_drivers.sh`` as sudo
