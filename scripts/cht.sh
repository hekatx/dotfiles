#!/usr/bin/bash

languages=`echo "golang lua typescript javascript nodejs" | tr ' ' '\n'`

selection=`echo "$languages" | fzf`
read -p "query: " query

formatted_query=`echo "$query" | tr ' ' '+'`

curl -s "cht.sh/$selection/$query" | bat --paging=always 

