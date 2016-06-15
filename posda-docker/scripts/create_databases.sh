#!/usr/bin/env bash

echo Creating databases.. this will fail if they arleady exist. Do not be alarmed.
createdb posda_files 
if [ $? -eq 0 ]; then
	psql posda_files < /posda/PosdaTools/Posda/sql/dicom_images.sql 
	echo "insert into file_storage_root values (0, '/cache', True)" | psql posda_files
fi	

createdb posda_nicknames
if [ $? -eq 0 ]; then
	psql posda_nicknames < /posda/PosdaTools/Posda/sql/Nickname.sql
	psql posda_nicknames < /posda/PosdaTools/Posda/sql/Nickname-AddFor.sql
fi


createdb app_stats
if [ $? -eq 0 ]; then
	psql app_stats < /posda/PosdaTools/Posda/sql/AppUsageTracker.sql
fi
