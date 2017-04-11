# dotfiles
My dotfiles.  
There will probably be some more explanation here later.

## The idea
I got the idea for this setup from [Timos dotfiles](https://github.com/timomeh/dotfiles), who apparently got it from a [HackerNews thread](https://news.ycombinator.com/item?id=11071754).

The basic idea is to version the files in our home directory with git without having a `.git` folder in our home directory (which can be very annoying) and goes like this:  

```sh
git init --bare $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
```

It took me a moment to wrap my head around this, so for future me I'll write down a short documentation of whats happening above.

* `git init --bare $HOME/.dotfiles`  
Creates a new `bare` git repository in our home folder called `.dotfiles`. A bare repository does not contain any working or checked out copies of files (further reading [here](http://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/)).  
* `alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`  
creates an alias for our newly created bare repository called `dotfiles`. We can use all git commands (like `add`, `commit`, `push`) with it, then being i.e. `dotfiles add .myfile`. Also, we're defining the `.git` directory (`~/.dotfiles`) and our working tree (our home folder) here.
* `dotfiles config --local status.showUntrackedFiles no`  
Hides untracked files when using `dotfiles status`, since the majority of the files in our home directory will most certainly never be tracked in our dotfiles repository.
* `echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc`  
Adds the alias to our shell config, which is optional

Further reading can be found [here](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

## Usage
All the dotfiles stay in our home directory. If we want to track a file, we simply check it in with our `dotfiles` alias like so:

```sh
~ $ dotfiles add .gitconfig
```

And then commit and push the same way.

## What to install
*A list of tools that need to be installed and settings to be applied for the dotfiles to work properly. Maybe this should be in a script*

* Install command line tools via `xcode-select --install` to be able to use git. Alternatively, you can install git via homebrew.
* Switch Shell to zsh via `chsh -s $(which zsh)`
* Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* Install [Homebrew](https://brew.sh/)
* Install tmux via `brew install tmux`
* Install [reattach-to-user-namespace](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard/)
* Install [rbenv](https://github.com/rbenv/rbenv)
* Install [nvm](https://github.com/creationix/nvm)
* Install [atom](https://atom.io/)
