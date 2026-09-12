# Repository Guidelines

## Project Structure & Module Organization

This repository is a Nix flake for one NixOS host and one Home Manager profile. `flake.nix` defines `nixosConfigurations.nixos` and `homeConfigurations.acup`; keep modules reachable from those outputs.

- `configuration/`: host-level NixOS settings such as boot, SSH, caches, locale, and hardware services.
- `packages/`: grouped system package lists and package categories.
- `home.nix`: Home Manager entry point for user `acup`.
- `home_packages/`: per-application Home Manager modules; prefer `default.nix` inside each app directory.
- `programs/`: custom package/program definitions included by the NixOS configuration.
- `modules/`: additional reusable NixOS modules.
- `grub_themes/`: theme assets and packaging for GRUB.

There is no dedicated test directory; validate through Nix evaluation and builds.

## Build, Test & Development Commands

- `nix flake check`: evaluate flake outputs and catch module or lockfile issues.
- `nixos-rebuild build --flake .#nixos`: build the system closure without switching to it.
- `home-manager build --flake .#acup`: build the Home Manager generation without activating it.
- `nix flake update`: update pinned inputs in `flake.lock`; review resulting package and module changes carefully.

Run commands from the repository root. Avoid committing the `result` symlink produced by Nix builds.

## Coding Style & Naming Conventions

Use idiomatic Nix with 2-space indentation for nested attribute sets and lists. Prefer small, focused modules over large mixed-purpose files. Name files by topic, for example `configuration/sshd.nix`, `packages/fonts.nix`, or `home_packages/ghostty/default.nix`.

Keep host constants aligned with `flake.nix` (`username = "acup"`, `system = "x86_64-linux"`). Add packages to the most specific existing group.

## Testing Guidelines

Before opening a PR or switching locally, run `nix flake check` plus the relevant build command. Use `nixos-rebuild build --flake .#nixos` for system changes and `home-manager build --flake .#acup` for Home Manager changes. For custom packages under `programs/` or `home_packages/`, ensure they evaluate through the parent configuration.

## Commit & Pull Request Guidelines

Recent history uses short, informal commit subjects such as `upd`, `large upd`, and `nvf`. Keep commits concise, but make them more descriptive when possible, for example `hypr: update window manager packages` or `home: add ghostty settings`.

Pull requests should describe the affected area, list validation commands run, and call out lockfile updates, new services, firewall ports, or hardware assumptions. Include screenshots only for visible UI/theme changes.

## Security & Configuration Tips

Do not commit secrets, machine-local tokens, or private keys. Be cautious with SSH, firewall ports, binary caches, Docker/VirtualBox, and `allowUnfree`; mention those explicitly in reviews.
