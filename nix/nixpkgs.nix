{ compiler ? "ghc843" }:
with builtins;
let
  rev = "6a3f5bcb061e1822f50e299f5616a0731636e4e7";
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  # nix-prefetch-url --unpack
  sha256 = "1ib96has10v5nr6bzf7v8kw7yzww8zanxgw2qi1ll1sbv6kj6zpd";
  config =
    { packageOverrides = super:
      let self = super.pkgs;
          lib = super.haskell.lib;
      in {
        haskell = super.haskell // {
          packages = super.haskell.packages // {
            ghc861 = super.haskell.packages.ghc861.override {
              overrides = self: super: {
                free-algebras = super.callPackage ./free-algebras-0.0.5.0.nix {};
              };
            };
            ghc843 = super.haskell.packages.ghc843.override {
              overrides = self: super: {
                free-algebras = super.callPackage ./free-algebras-0.0.5.0.nix {};
              };
            };
            ghc822 = super.haskell.packages.ghc822.override {
              overrides = self: super: {
                free-algebras = super.callPackage ./free-algebras-0.0.5.0.nix {};
              };
            };
            ghc802 = super.haskell.packages.ghc802.override {
              overrides = self: super: {
                concurrent-output = super.callPackage ./concurrent-output-1.9.2.nix {};
                ansi-terminal = super.callPackage ./ansi-terminal-0.6.3.1.nix {};
                async = super.callPackage ./async-2.1.1.1.nix {};
                lifted-async = super.callPackage ./lifted-async-0.9.3.3.nix {};
                exceptions = super.callPackage ./exceptions-0.8.3.nix {};
                free-algebras = super.callPackage ./free-algebras-0.0.5.0.nix {};
              };
            };
          };
        };
      };
    };
  nixpkgs = import (fetchTarball { inherit url sha256; }) { inherit config; };
in nixpkgs
