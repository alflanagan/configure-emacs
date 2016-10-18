#!/usr/bin/env bash

find . -name elpa -prune -o -name '*.el' -print0 | \
    xargs -0 -L 1 -i -r emacs --batch --eval '(progn (package-initialize)(check-declare-file "'{}'"))'
