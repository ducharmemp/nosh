{
  description = "Development environment";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";

  outputs =
    { self
    , flake-utils
    , nixpkgs
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { system = system; };
      in
      {
        devShell = pkgs.mkShell {
          packages = with pkgs; [
            # See https://github.com/NixOS/nixpkgs/issues/59209.
            bashInteractive
          ];
          buildInputs = with pkgs; [
            inotify-tools
            libnotify
            glibc
            erlang_26
            (beam.packagesWith erlang_26).elixir_1_15
          ];
          shellHook = ''
            git config --local include.path ../.gitconfig
          '';
        };
      }
    );
}
