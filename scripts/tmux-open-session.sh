#!/usr/bin/bash

projects=`echo "todo dsa playground" | tr ' ' '\n'`

selection=`echo "$projects" | fzf`

source "./$selection"
