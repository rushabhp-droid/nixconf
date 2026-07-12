{ inputs, ... }: { flake.overlays.cachyos = inputs.nix-cachyos-kernel.overlays.pinned; }
