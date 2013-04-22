#!/bin/sh

repid=$(curl http://dailycrimelog.cupolice.cornell.edu/ 2> /dev/null | grep -m1 RepID | sed 's/.*=\([^"]*\)".*$/\1/')
