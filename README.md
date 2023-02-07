# QuartusCLI

Quartus CLI test project to flash a simple program using command line tools in a De1-Soc

- Numbers 0 to 5 are showed on the HEX display
- Leds (LEDR0 to LEDR3) light up when push buttons (KEY0 to KEY3) are pressed

## Installation

### With Nix

Nix needs to be installed first (see <https://nixos.org/download.html>)

1) Clone the repository ``git clone https://github.com/SebastienDeriaz/QuartusCLI``
2) cd into the directory ``cd QuartusCLI``
3) Build the binary file ``nix run .#build``
4) Flash the binary file ``nix flash .#flash``
   1) If necessary, the build command will be executed automatically

### Without Nix

1) Install quartus prime lite (tools ``quartus_sh`` and ``quartus_pgm`` are required)
2) cd into the directory ``cd QuartusCLI``
3) Build the binary file ``build.sh``
4) Flash the binary file ``flash.sh``

### Note

If the flashing fails and the JTAG cannot be detected, run ``sudo init_usbblaster_drivers.sh`` to allow user access to the usb-blaster
