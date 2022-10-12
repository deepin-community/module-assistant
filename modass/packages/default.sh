#!/bin/sh
#
# (c) Eduard Bloch <blade@debian.org>, 2003
# generic maintainer script for module-assistant controlled packages
# to be sourced or copied as example code

# autodetecting values. They may be overriden by the caller.

MA_DIR=${MA_DIR:-/usr/share/modass}

. $MA_DIR/packages/generic.sh

$1 "$@"
