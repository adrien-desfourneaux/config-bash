Configuration de bash
======================

Mes fichiers de configuration de bash

Structure
---------

  * .bash_profile : Fichier de configuration de bash
  * alias.bash : les alias de commandes
  * path.bash : les ajouts dans le $PATH
  * prompt.bash : les modifications du prompt

Installation
------------

Backups éventuels

	cd;
	cp -r .bash .bash.bak

Installation

	cd;
	git clone https://github.com/dieze/config-bash.git .bash
	ln -s .bash/.bash_profile .bash_profile