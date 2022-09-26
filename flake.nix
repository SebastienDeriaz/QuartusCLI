{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = inputs: inputs.flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      hello = pkgs.stdenv.mkDerivation {
        name = "hello-vhdl";
        version = "22.09";
        src = ./src;
        nativeBuildInputs = with pkgs; [
          quartus-prime-lite
        ];
        buildPhase = builtins.readFile ./build.sh;
      };
    in
    {
      packages.default = hello;
      devShells.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          quartus-prime-lite
        ];
      };
    });
}
