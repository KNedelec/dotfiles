#!/bin/sh

# get a cookie
# cookie list: list localhost cookies
# cookie list '*lemonde.fr': list cookies from lemonde.fr
# cookie _ga localhost: show _ga cookie

# firefox only
cookie_path=~/Library/ApplicationSupport/Firefox/Profiles/*.default-release
cp $cookie_path/cookies.sqlite /tmp/_cookie 

cookie_host=$2

if [ -z "$cookie_host" ]
then
  cookie_host="localhost"
fi

# first arg list
if [[ $1 == "list" ]]
then
  sqlite3 /tmp/_cookie "select * from moz_cookies where host like '$cookie_host'"
  exit 1
fi

# first arg cookie name
cookie_name=$1

if [ -z "$cookie_name" ]
then
  cookie_name="sessionid"
fi

sqlite3 /tmp/_cookie "select value from moz_cookies where name like '$cookie_name' and host='$cookie_host'"
rm /tmp/_cookie

