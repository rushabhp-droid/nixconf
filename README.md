# ❄️ nixconf

Personal NixOS configuration managed as a Nix flake, using [flake-parts](https://github.com/hercules-ci/flake-parts) and [import-tree](https://github.com/vic/import-tree) for modular, composable system & home-manager declarations.

## ✨ Overview

|                     |                                                                                                                   |
| ------------------- | ----------------------------------------------------------------------------------------------------------------- |
| **OS**              | NixOS Unstable                                                                                                    |
| **Desktop**         | Hyprland (Wayland)                                                                                                |
| **Display Manager** | SDDM                                                                                                              |
| **Shell**           | Bash + Starship                                                                                                   |
| **Terminal**        | Kitty                                                                                                             |
| **Editor**          | Helix                                                                                                             |
| **Browser**         | Zen                                                                                                               |
| **Theme**           | [Stylix](https://github.com/nix-community/stylix) (kanagawa-dragon dark palette)                                  |
| **Fonts**           | JetBrainsMono Nerd Font, Noto Color Emoji                                                                         |
| **Cursor**          | Bibata Modern Ice                                                                                                 |
| **Icons**           | WhiteSur                                                                                                          |
| **Gaming**          | Steam, Gamemode, Gamescope, Heroic, Lutris, MangoHud, PrismLauncher                                               |
| **LLM Agents**      | [opencode](https://github.com/anomalyco/opencode) via [llm-agents.nix](https://github.com/numtide/llm-agents.nix) |
| **Formatter**       | treefmt (nixfmt, statix, deadnix, prettier)                                                                       |

## 🏠 Hosts

### `netanyahu`

MSI Katana laptop with NVIDIA (hybrid / PRIME offload) + Intel, NVMe storage.

| Component     | Details                                                                                                              |
| ------------- | -------------------------------------------------------------------------------------------------------------------- |
| GPU           | NVIDIA (open driver, fine-grained power management) + Intel (PRIME)                                                  |
| Audio         | PipeWire                                                                                                             |
| Bluetooth     | Enabled                                                                                                              |
| Apple Devices | [LibrePods](https://github.com/nix-community/nixpkgs/pkgs/by-name/li/librepods) — AirPods / Apple device integration |
| Power         | auto-cpufreq                                                                                                         |
| Disk Layout   | GPT — 512 MB ESP (`/boot`) + ext4 root (`/`), managed by [disko](https://github.com/nix-community/disko)             |
| Swap          | zram                                                                                                                 |
| Optimus       | [Cardwire](https://github.com/opengamingcollective/cardwire) (graphics card management)                              |

## 📂 Project Structure

```
.
├── flake.nix                       # Flake entrypoint — inputs & outputs via flake-parts
├── flake.lock
├── wallpapers/                     # Wallpaper collection used by Stylix / Hyprpaper
└── modules/
    ├── parts.nix                   # flake-parts options (homeModules, supported systems)
    ├── treefmt.nix                 # Code formatting (nixfmt, statix, deadnix, prettier)
    ├── overlays/
    │   ├── cachyos.nix             # CachyOS kernel overlay
    │   └── librepods.nix           # LibrePods Qt/wgpu overlay
    ├── hosts/
    │   └── netanyahu/
    │       ├── system/
    │       │   ├── default.nix             # nixosConfigurations.netanyahu
    │       │   ├── configuration.nix       # Module imports & host networking
    │       │   ├── disko.nix               # Declarative disk partitioning
    │       │   └── hardware-configuration.nix
    │       └── home/
    │           └── rushabhp/
    │               ├── default.nix         # home-manager NixOS integration
    │               └── home.nix            # Per-user home-manager module imports
    └── features/
        ├── nixos/                  # NixOS-level (system) modules
        │   ├── core/               # Boot, locale, nix settings, users
        │   ├── desktop/            # Hyprland, SDDM
        │   ├── hardware/           # NVIDIA, Bluetooth, sound, cardwire, udev, power mgmt
        │   │   └── power-management/  # auto-cpufreq
        │   └── system/             # Bash, comma, firewall, gaming, llm-agents, Stylix, zram
        └── home/                   # home-manager (user) modules
            ├── desktop/            # Hyprland, Hyprpaper, Hypridle, Hyprlock, SwayNC,
            │                       # SwayOSD, Waybar, Rofi, wleave, cliphist, XDG
            └── programs/           # Bash, bat, btop, direnv, eza, fastfetch, fzf, Git,
                                    # Helix, jj, Kitty, mcfly, multimedia, Neovim, Rofi,
                                    # Starship, wleave, Zen, zoxide
```

## 🧩 Flake Inputs

| Input                                                              | Purpose                                   |
| ------------------------------------------------------------------ | ----------------------------------------- |
| [nixpkgs](https://github.com/NixOS/nixpkgs) (unstable)             | Package set & NixOS modules               |
| [flake-parts](https://github.com/hercules-ci/flake-parts)          | Structured flake outputs                  |
| [import-tree](https://github.com/vic/import-tree)                  | Auto-import the `modules/` directory tree |
| [home-manager](https://github.com/nix-community/home-manager)      | Declarative user environment              |
| [stylix](https://github.com/nix-community/stylix)                  | System-wide theming from a wallpaper      |
| [disko](https://github.com/nix-community/disko)                    | Declarative disk partitioning             |
| [auto-cpufreq](https://github.com/AdnanHodzic/auto-cpufreq)        | Automatic CPU power management            |
| [zen-browser](https://github.com/0xc000022070/zen-browser-flake)   | Zen browser Nix packaging                 |
| [firefox-addons](https://gitlab.com/rycee/nur-expressions)         | Firefox / Zen extension packaging         |
| [musnix](https://github.com/musnix/musnix)                         | Real-time audio support                   |
| [cardwire](https://github.com/opengamingcollective/cardwire)       | Hardware-level audio card management      |
| [treefmt-nix](https://github.com/numtide/treefmt-nix)              | Unified code formatting                   |
| [nix-cachyos-kernel](https://github.com/xddxdd/nix-cachyos-kernel) | CachyOS performance kernel                |
| [nixvim](https://github.com/nix-community/nixvim)                  | Neovim configuration framework            |
| [llm-agents](https://github.com/numtide/llm-agents.nix)            | LLM agent packages (opencode)             |

## 🚀 Usage

### Prerequisites

- [Nix](https://nixos.org/download/) with flakes enabled
- (For a fresh install) boot from a NixOS live USB

### Build & Switch

```bash
# Rebuild the system (from within the repo)
sudo nixos-rebuild switch --flake .#netanyahu
```

### Format Code

```bash
nix fmt
```

### Fresh Install with Disko

```bash
# Partition & format the disk declaratively
sudo nix run github:nix-community/disko -- --mode destroy,format,mount .#netanyahu

# Install NixOS
sudo nixos-install --flake .#netanyahu
```

## 🏗️ Architecture

The flake uses **flake-parts** with **import-tree** to automatically discover and import every `.nix` file under `modules/`. Each module registers itself on the flake via `flake.nixosModules.*` or `flake.homeModules.*`, and host configurations compose these modules by importing the ones they need.

```
flake.nix
  └─ flake-parts + import-tree
       └─ modules/**/*.nix  (auto-discovered)
            ├─ flake.nixosModules.*       ← system-level features
            ├─ flake.homeModules.*        ← user-level features
            ├─ flake.nixosConfigurations.* ← host definitions
            ├─ flake.diskoConfigurations.* ← disk layouts
            └─ flake.overlays.*           ← package overlays
```

CI is handled via a GitHub Actions workflow (`.github/workflows/build-and-cache.yml`) that builds the `netanyahu` configuration and pushes it to a [Cachix](https://www.cachix.org/) cache (`kryptoaries`).

This means adding a new feature is as simple as dropping a `.nix` file into the appropriate `modules/features/` subdirectory — no manual import list to update at the flake level.

## 📜 License

Personal configuration — feel free to reference or adapt for your own setup.
