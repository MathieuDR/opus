{
  description = "Zig development.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            zig
            just
          ];

          shellHook = ''
            export ZIG_GLOBAL_CACHE_DIR="$PWD/.zig-cache/global"
            export ZIG_LOCAL_CACHE_DIR="$PWD/.zig-cache/local"
          '';
        };
      }
    );
}
