## 🚀 Installation

1. **Clone repo to home directory:**
   ```bash
   git clone https://github.com/Gj1337/dotfiles
   cd ~/dotfiles
   ```

2. **Install stow** (symlink manager):
   ```bash
   # macOS
   brew install stow
   
   # Ubuntu/Debian
   sudo apt install stow
   ```

3. **Setup:**
   ```bash
   # Create symlinks for all configs in your home directory.
   for d in */; do echo "Stowing ${d%/}"; stow "${d%/}"; done
