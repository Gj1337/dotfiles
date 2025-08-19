## 🚀 Installation

1. **Clone repo to home directory:**
   ```bash
   git clone <repo-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. **Install stow** (symlink manager):
   ```bash
   # macOS
   brew install stow
   
   # Ubuntu/Debian
   sudo apt install stow
   ```

3. **Create symlinks:**
   ```bash
   stow */
   ```
   This creates symlinks for all configs in your home directory.

