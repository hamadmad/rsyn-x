{
  description = "Rsyn-X development";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
              devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # C++ Compiler is already part of stdenv
            boost
            catch2
            cmake
	    libpng
	    glpk
	    CoinMP
	    libsForQt5.qt5.qtbase
	    libsForQt5.qt5.qtwayland
	    egl-wayland
          ];
        };

      };
    };
}
