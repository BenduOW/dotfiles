#!/bin/sh

pgrep -f redshift &> /dev/null && killall redshift || redshift
