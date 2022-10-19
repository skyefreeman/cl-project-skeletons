#!/bin/bash

set -euo pipefail

function show_help() {
    cat <<HELP
Usage:  run-prod.sh  [ -h ]

Description:
    Loads and starts the server process, which will start the lisp image using 'ros exec clackup'. This script is expected to be run from systemctl, but should work when called directly.

Options:
    -h      Show this help text and exit.
HELP
}

while getopts "h" option
do
    case "$option" in
	h)  show_help
            exit 0
            ;;
	*)  echo ">>> Error: Unknown option '$option'." 1>&2
            exit 1
            ;;
    esac
done

export <% @var name %>_ENV='production'
ros exec clackup --port <% @var port %> app.lisp
