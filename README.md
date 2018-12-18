Bash configuration
======================

Installation
------------

Eventual backups

```sh
cp -r ~/.bash ~/.bash.bak
cp ~/.bash_profile ~/.bash_profile.bak
```

Installation

```sh
git clone https://github.com/dieze/config-bash.git ~/.bash
ln -s ~/.bash/bash_profile ~/.bash_profile
```

Then move old `~/.bash_profile` configurations (now in `~/.bash_profile.bak`) to the new structure.
