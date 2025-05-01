# 📊 NixOS Cava

> Declarative NixOS module to install CAVA, a Console-based Audio Visualizer, and deploy a secure per-user configuration.

## 📦 Features

- 🔒 **Secure config directory :** Creates and protects ```~/.config/cava``` with ```700``` permissions and correct ownership.

- ⚙️ **Config deployment :** Installs your ```config``` file into ```~/.config/cava/config``` with ```600``` permissions.

- 🎛️ **CAVA package :** Ensures ```cava``` is installed via ```environment.systemPackages```.

- 🔄 **Idempotent :** Cleans and recreates the config directory on each rebuild without removing other user data.

- 💾 **Backup guidance :** Documentation includes commands to back up any existing ```~/.config/cava``` before applying changes.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/cava{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-cava = fetchGit {
    url = "https://github.com/typovrak/nixos-cava.git";
    ref = "main";
    rev = "7c18a855ed1f52dfa39771e1ffb78d99d1851e47"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-cava}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

To see your console-based audio visualizer ricing, execute this command
```bash
cava
```

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
