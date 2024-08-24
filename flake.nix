{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = { self, nixpkgs, flake-utils, treefmt-nix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pname = "microui-zig";
        pkgs = import nixpkgs { inherit system; };
        treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
        microui-zig = pkgs.stdenv.mkDerivation {
          inherit pname;
          version = "dev";
          src = ./.;

          nativeBuildInputs = [
            pkgs.zig_0_13.hook
          ];

          zigBuildFlags = [
            "-Doptimize=Debug"
          ];
        };
      in
      {
        # Use `nix fmt`
        formatter = treefmtEval.config.build.wrapper;

        # Use `nix flake check`
        checks = {
          inherit microui-zig;
          formatting = treefmtEval.config.build.check self;
        };

        # nix build .
        # nix build .#default
        packages = {
          inherit microui-zig;
          default = microui-zig;
        };

        # nix run .#default
        apps.default = flake-utils.lib.mkApp {
          drv = microui-zig;
        };

        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            zig_0_13
            zls
            nil
          ];

          shellHook = ''
            export PS1="\n[nix-shell:\w]$ "
          '';
        };
      });
}
