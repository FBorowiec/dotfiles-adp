#!/usr/bin/env bash

languages=`echo "cpp c lua python shell" | tr ' ' '\n'`
core_utils=`echo "xargs find mv cp sed awk curl tar rg" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
if [[ -z $selected ]]; then
    exit 0
fi
read -p "Query: " query

if printf $languages | grep -qs $selected; then
    tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl cht.sh/$selected+$query & while [ : ]; do sleep 1; done"
fi
