{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: let
    eachSystem = fn: nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "aarch64-linux"
    ] (system: (fn {
      inherit system;
      pkgs = (import nixpkgs { inherit system; });
    }));
  in {
    devShells = eachSystem ({ pkgs, ... }: {
      default = pkgs.callPackage ./shell.nix {};
    });
    packages = eachSystem ({ pkgs, ... }: let
      lexer = name: pkgs.callPackage ./compile-lexer.nix { src = ./lexers; lexer-name = name; };
    in {
      compter_mot = lexer "compter_mot";
      start_stop = lexer "start_stop";
      frequence = lexer "frequence";
    });
  };
}
