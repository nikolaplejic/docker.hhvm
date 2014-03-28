#!/bin/sh
exec hhvm --mode server -vServer.Type=fastcgi -vServer.Port=9000
