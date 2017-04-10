#!/bin/bash
ATOM_PACKAGES=$HOME/.atom/.atom-packages.txt
apm list --installed --bare > $ATOM_PACKAGES
echo "A list of your atom packages was created at $ATOM_PACKAGES"
