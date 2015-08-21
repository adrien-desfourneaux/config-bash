My bash configuration
======================

Those are my bash configuration files

Structure
---------

  * .bash_profile : bash config file with imports
  * alias.bash : command aliases
  * path.bash : configuration of $PATH
  * prompt.bash : configuration of bash prompt

Installation
------------

Eventual backups

	cp -r ~/.bash ~/.bash.bak
	cp ~/.bash_profile ~/.bash_profile.bak

Installation

	git clone https://github.com/dieze/config-bash.git ~/.bash
	ln -s ~/.bash/.bash_profile ~/.bash_profile

You may need to move your old ~/.bash_profile configurations (now in ~/.bash_profile.bak) to the new structure.
