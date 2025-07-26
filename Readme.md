# Dotfiles

My dotfiles, currently somewhat bare after resetting in summer of 2025 after maintinging my old ones since 2017.

## What's in

- Managed by [GNU Stow](https://www.gnu.org/software/stow/)
- Version management by [mise](https://mise.jdx.dev/)
- Using [homebrew](https://brew.sh/) for package management
- Shell is [fish](https://fishshell.com/)

### Rationale

I want to be consious about my configuration. In the past, I would just add new, cool things on a whim without putting to much thought into it. This would lead to a confuluted config that did not feel like home.

I'm holding myself accountable here by writing out the decisions I made.

#### Stow
In the past, I used a [bare repository](https://www.atlassian.com/git/tutorials/dotfiles) to manage my dotfiles. This made it simple to track my dotfiles in Git, but came with side-effects I did not like:

- There now is a git repository in my root directory. Even if only explicit files are tracked, a lot of tools pick up the `.git` folder and try to act on it (e.g. when opening any file in VSCode that was not in another explicit Git directory)
- Adding new files to the repositry with the explicit command felt unergonomic
- It requires a lot of git-specific setup

The current solution is simple: The contents of this repository are store in a `/dotfiles` folder in my home directory, which is a Git repository. It resembles the same structure I want in my home directory. To apply changes, I simply run `stow .`

#### Mise
I tried a multitude of runtime version managers. There are managers specific to a single language, that tend to be more stable but require you to install multiple tools. The ones I used are `rbenv`, `rvm`, `nvm` and `pyenv`.  
There are others that aim to manage multiple languate runtime version, of which I tried `asdf` and now `mise`.

I don't have a clear path forward here yet, as I haven't been happy with either solution so far. I don't have enough experience to talk about `mise` yet, so I is in here for an evaluation.

#### Homebrew
I've been using homebrew for my entire career and have little to complain about. I utilize a `Brewfile` to have all my packages as code.

#### Fish
It gives me a lot of features ot of the box that I would have needed to add manully with zsh, such as autocompletion. I decided to not roll any custom setup for now and just stick to a community prompt. I might change that again if it annoys me too much.


