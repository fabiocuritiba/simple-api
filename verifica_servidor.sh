#!/bin/bash

#get input data
if [ $# -eq 0 ]; then
	echo "Type: $0 URL" 
	exit 0
fi

URL=$1

#Files handled here
LOGFILE=~fabio/file.log
OUTFILE=~fabio/output.log

echo "$(date +%F\ %T) ----------------" >> $LOGFILE

code_http=$(curl -w %{http_code} -s -o $OUTFILE $URL)

# validate return code
if [ $code_http -ne 200 ]
then
	echo "$(date +%F\ %T) Codigo de erro: $code_http" >> $LOGFILE
else
	echo "$(date +%F\ %T) Codigo de retorno: $code_http - URL: $URL" >> $LOGFILE
fi

echo "$(date +%F\ %T) ----------------" >> $LOGFILE
