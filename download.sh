#!/bin/sh

repid=$(curl http://dailycrimelog.cupolice.cornell.edu/ 2> /dev/null | grep -m1 RepID | sed 's/.*=\([^"]*\)".*$/\1/')
while test -f  "downloads/$repid" || curl "http://dailycrimelog.cupolice.cornell.edu/?RepID=${repid}" > "downloads/$repid"; do
  grep 'There is no report for the date selected' "downloads/${repid}" 1>/dev/null && rm  "downloads/${repid}" && break
  repid=$(($repid - 1))
done
