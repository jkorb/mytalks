#!/usr/bin/env sh
set -euo pipefail

COMMAND=${1:-""}

_usage_() {

cat<<EOF

Usage: sync.sh <command>

There are 4 commands:

from-biblatex : syncs the .bibtex, .json, .yaml files from the .bib file
from-bibtex   : syncs the .bib, .json, .yaml files from the .bibtex file
from-json     : syncs the .bibtex, .bib, .yaml files from the .json file
from-yaml     : syncs the .bibtex, .bib, .json files from the .yaml file

WARNING: No tests are run, this will override the other formats without asking.
         Use with care.

EOF
}

_sync_() {

    local FROM=$1
    local ARRAY=("$BIBLATEX" "$BIBTEX" "$JSON" "$MARKDOWN")

    for TO in "${ARRAY[@]}"; do
        [[ ! $TO == $FROM ]] && pandoc -s -f $(dirname "$FROM") -t $(dirname "$TO") -o $TO $FROM
    done

}

_main_() {

    local BIBLATEX=biblatex/mytalks.bib
    local BIBTEX=bibtex/mytalks.bibtex
    local JSON=csljson/mytalks.json
    local MARKDOWN=markdown/mytalks.yaml

    if [[ $COMMAND == "from-biblatex" ]]; then
        _sync_ $BIBLATEX
    elif [[ $COMMAND == "from-bibtex" ]]; then
        _sync_ $BIBTEX
    elif [[ $COMMAND == "from-json" ]]; then
        _sync_ $JSON
    elif [[ $COMMAND == "from-yaml" ]]; then
        _sync_ $MARKDOWN
    fi

}

_main_
