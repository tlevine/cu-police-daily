#!/bin/sh

repid=$(curl http://dailycrimelog.cupolice.cornell.edu/ 2> /dev/null | grep -m1 RepID | sed 's/.*=\([^"]*\)".*$/\1/')
while test -f  "downloads/$repid" || curl "http://dailycrimelog.cupolice.cornell.edu/?RepID=${repid}" > "downloads/$repid"; do
  repid=$(($repid - 1))
  sleep 1s
done
