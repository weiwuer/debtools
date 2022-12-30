#!/bin/bash
dotfiles_dir="$HOME/dotfiles"

files=(
".config/i3/config"
".bashrc"
".bash_aliases"
".bash_profile"
)

[[ ! -d "$dotfiles_dir" ]] \
	&& mkdir -p "$dotfiles_dir"\
	&& printf "mkdir $dotfiles_dir: $?\n"

for file in ${files[@]}; do
	cp -r $HOME/$file $dotfiles_dir/$file 2>/dev/null
	notify-send "$?: $dotfiles_dir/$file" \
		|| printf "$?: $dotfiles_dir/$file\n"
done
