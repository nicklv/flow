#!/bin/sh

FLOW=$1
mkdir tmp

printf "\nInitial status:\n"
$FLOW status --no-auto-start --old-output-format .

printf "\nDelete c.js:\n"
mv c.js tmp
$FLOW force-recheck --no-auto-start c.js
$FLOW status --no-auto-start . --old-output-format

printf "\nDelete b.js:\n"
mv b.js tmp
$FLOW force-recheck --no-auto-start b.js
$FLOW status --no-auto-start --old-output-format .

printf "\nRestore b.js:\n"
mv tmp/b.js .
$FLOW force-recheck --no-auto-start b.js
$FLOW status --no-auto-start --old-output-format .

printf "\nRestore c.js:\n"
mv tmp/c.js .
$FLOW force-recheck --no-auto-start c.js
$FLOW status --no-auto-start --old-output-format .

printf "\nDelete d.json:\n"
mv d.json tmp
$FLOW force-recheck --no-auto-start d.json
$FLOW status --no-auto-start --old-output-format .

mv tmp/d.json .
rmdir tmp
printf "\nDone!\n"
