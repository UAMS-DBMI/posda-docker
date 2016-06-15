#!/usr/bin/env bash

cd /posda/PosdaTools
source bin/shell_library.sh
clear

echo Adding new users. Empty username will exit.

CreatePassWordFile.pl /cache/Login.db
