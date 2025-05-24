# 🗂️ My Dotfiles

This repository contains my personal dotfiles managed with [chezmoi](https://www.chezmoi.io/). I use this configuration to quickly set up my configuration on my machines.

## 💻 What are Dotfiles?

Dotfiles are plain text configuration files that control the behavior of shells, editors, version control systems, and other tools on Unix-like systems. Keeping them in a version-controlled repository ensures a consistent environment across devices.

## 🛠️ What is chezmoi?

[chezmoi](https://www.chezmoi.io/) is a cross-platform dotfile manager that securely manages your personal configuration files. It allows you to track, template, and deploy your dotfiles to any machine with minimal effort.

## 🚀 How to Install This Configuration

1. **Install chezmoi**  
   If you don't already have chezmoi installed, follow the instructions at [chezmoi.io/install](https://www.chezmoi.io/install/).

2. **Initialize with this repository**

   ```sh
   chezmoi init https://github.com/neilsmind/dotfiles.git
   ```

3. **Apply the configuration**

   ```sh
   chezmoi apply
   ```

   This will copy the managed dotfiles to the appropriate locations in your home directory.

## 💡 Common chezmoi Commands

| Command                        | Description                                 |
| ------------------------------ | ------------------------------------------- |
| `chezmoi init <repo>`          | Initialize chezmoi with your dotfiles repo  |
| `chezmoi apply`                | Apply changes to your home directory        |
| `chezmoi add <file>`           | Add a file to chezmoi management            |
| `chezmoi edit <file>`          | Edit a managed file                         |
| `chezmoi diff`                 | Show differences between source and target  |
| `chezmoi status`               | Show status of managed files                |
| `chezmoi update`               | Pull latest changes from your repo          |
| `chezmoi cd`                   | Open a shell in the chezmoi source dir      |
| `chezmoi git <args>`           | Run git commands in the chezmoi source dir  |

## 📚 Learn More

- [chezmoi documentation](https://www.chezmoi.io/docs/)
- [Dotfiles best practices](https://dotfiles.github.io/)
