#!/usr/bin/env bash

echo Running Posda init..
/scripts/create_databases.sh
/scripts/create_cache_dirs.sh


cd /posda/PosdaTools
source bin/shell_library.sh

# launch without daemonizing, so docker can log stdout
AppController.pl localhost $POSDA_PORT $APP_CONTROLLER_ROOT/Config/AppConfig
