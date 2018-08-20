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

### Move to a new machine

It's just a Git Repo. But you can't clone into a directory with existing files, like macOS will write some files into the home directory.

1. Clone into a directory with a seperate git directory and a temporary directory as working tree.
   ```sh
   git clone --separate-git-dir=$HOME/.dotfiles git@github.com:plsr/dotfiles.git $HOME/dotfiles-tmp
   ```

2. Copy the working tree from the tmp directory into the home directory.
   ```sh
   cp -r ~/dotfiles-tmp/. ~
   ```

3. Delete the tmp dotfiles directory.
   ```sh
   rm -rf ~/dotfiles-tmp/
   ```

4. Add the dotfiles-git alias to the current shell.  
   ```sh
   alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
   ```

5. Don't show untracked files.
   ```sh
   dotfiles config --local status.showUntrackedFiles no
   ```

### Getting started on a new machine

1. Get basics working
	* sign in to iCloud
	* basic setup of Mouse & Keyboard
2. Install Homebrew
3. Intall git (will be re-installed via the Brewfile in step 6)
4. Set up SSH key for Github
5. Clone dotfiles
6. `brew bundle`
7. Change Alfred Shortcuts to CMD + Space
8. Setup Dropbox and 1Password, then sign in to all the apps
9. You're all set up

## Vim Plugin Installation
Plugins are installed via Vundle, so there is little to worry about. However, it
might happen that Vundle is not working out of the box. Reinstalling will solve
that issue. Afterwards, just run `:PluginInstall` in vim and you're cooking with
gas.
