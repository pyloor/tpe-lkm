#!/bin/bash

template=$1
outfile=$2

addr_do_execve=$(./scripts/find_address.sh do_execve)
addr_compat_do_execve=$(./scripts/find_address.sh compat_do_execve)

cat << EOF>$outfile
/*

DO NOT EDIT THIS FILE!! It has been auto-generated by make

Edit $template instead.

*/

EOF

cat $template \
	| sed "s/|addr_do_execve|/0x$addr_do_execve/" \
	| sed "s/|addr_compat_do_execve|/0x$addr_compat_do_execve/" \
	>> $outfile

