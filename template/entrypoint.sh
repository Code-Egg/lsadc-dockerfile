#!/bin/bash
LSDIR='/usr/local/lslb'

if [ -z "$(ls -A -- "${LSDIR}/conf/")" ]; then
	cp -R ${LSDIR}/.conf/* ${LSDIR}/conf/
fi

if [ -z "$(ls -A -- "${LSDIR}/admin/conf/")" ]; then
	cp -R ${LSDIR}/admin/.conf/* ${LSDIR}/admin/conf/
fi

if [ ! -e ${LSDIR}/conf/serial.no ] && [ ! -e ${LSDIR}/conf/license.key ]; then
    rm -f ${LSDIR}/conf/trial.key*
    wget -P ${LSDIR}/conf/ http://license.litespeedtech.com/reseller/trial.key
fi
chown 999:999 ${LSDIR}/conf/ -R
chown 999:1000 ${LSDIR}/admin/conf/ -R

${LSDIR}/bin/lslbctrl start
$@
while true; do
	if ! ${LSDIR}/bin/lslbctrl status | /usr/bin/grep -I 'lslbd is running with PID *' > /dev/null; then
		break
	fi
	sleep 60
done