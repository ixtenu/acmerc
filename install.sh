#!/usr/bin/env sh
set -eu

outdir=$(readlink -f "$HOME/bin")
scriptdir="$(cd -- "$(dirname $(readlink -f "$0"))" 2>&1 >/dev/null && pwd -P)"

if [ $# -ne 0 ]; then
	echo "$0: unexpected arguments: $@" 1>&2
	echo "usage: $0" 1>&2
	echo "Create symlinks in $outdir for $scriptdir/bin/9a and $scriptdir/bin/9s." 1>&2
	exit 1
fi

installfile() {
	fp="$(readlink -f $1)"
	fn="$(basename $1)"
	lp="$outdir"/"$fn"
	if [ -e "$lp" ]; then
		if [ -L "$lp" ]; then
			ln -svf "$fp" "$lp"
		else
			echo "warning: $lp exists and is not a symbolic link, leaving it" 2>&1
		fi
	else
		ln -sv "$fp" "$lp"
	fi
}

installfile "$scriptdir/bin/9a"
installfile "$scriptdir/bin/9s"
