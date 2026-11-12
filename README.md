# dot-files

My terminal and Neovim setup for macOS (Apple Silicon).

## What's here

| Path | Linked to | What it is |
| --- | --- | --- |
| `zsh/.zshrc` | `~/.zshrc` | oh-my-zsh, plugins, nvm |
| `zsh/.zprofile` | `~/.zprofile` | Homebrew and pipx on `PATH` |
| `zsh/aliases.zsh` | `~/.oh-my-zsh/custom/aliases.zsh` | git and make aliases |
| `git/ignore` | `~/.config/git/ignore` | global gitignore |
| `nvim/` | `~/.config/nvim` | Neovim config (packer, telescope, lsp-zero, treesitter, prettier) |
| `Brewfile` | | everything installed with Homebrew |
| `install.sh` | | sets the whole thing up |

## New laptop setup

1. **Clone the repo.** Running `git` the first time prompts you to install the
   Xcode command line tools. Accept, wait for the install to finish, then
   clone again.

   ```sh
   git clone https://github.com/adamp01/dot-files.git ~/dot-files
   ```

2. **Run the installer.**

   ```sh
   ~/dot-files/install.sh
   ```

   This installs Homebrew, everything in the `Brewfile` (iTerm2, Victor Mono
   and Source Code Pro fonts, Neovim, ripgrep, fd, prettierd, pipx), oh-my-zsh
   with the `zsh-syntax-highlighting` and `zsh-autosuggestions` plugins, and
   nvm with the latest Node LTS. It then symlinks the config files into place.
   Any file it would overwrite is moved to `~/.dotfiles-backup/<timestamp>/`
   first. You can safely run it again.

3. **Set up iTerm2.** Open iTerm2 and set the font to **VictorMono Nerd Font**
   (`Cmd ,` → Profiles → Text). Use iTerm2 from now on.

4. **Install the Neovim plugins.** Run `nvim`. The first launch clones packer
   and shows some errors, which you can ignore. Quit, open `nvim` again and run
   `:PackerSync`. Restart Neovim once that finishes. Mason installs the
   language servers (tsserver, eslint, lua_ls, rust_analyzer) the first time
   you open a matching file.

5. **Set your git identity.** Your name and email aren't stored in this repo.

   ```sh
   git config --global user.name "Adam Wood"
   git config --global user.email "you@example.com"
   ```

6. **Add machine-specific settings.** Put secrets, tokens and anything that
   only applies to one machine in `~/.zshrc.local`. `.zshrc` loads it if it
   exists, and it's never committed.

Open a new terminal tab and everything should be working.

## Making changes

Every config file is a symlink into this repo, so editing `~/.zshrc` (or the
Neovim config) edits the repo copy. Commit and push from `~/dot-files`.

To add a new Homebrew package, add it to `Brewfile` and run
`brew bundle --file=~/dot-files/Brewfile`. To capture everything currently
installed instead, run `brew bundle dump --file=~/dot-files/Brewfile --force`.
