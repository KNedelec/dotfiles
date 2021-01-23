#!/bin/bash

p_root=("./front" ".")

# get the version from a package.json
# if arg, check in {p_root}/node_modules/arg
# otherwise check in {p_root}/package.json to get the current module version

# use -l as second arg to distinguish if the module is a symlink or a dir
# this will prefix with "d" for dir or "l" for link

p_name="package.json"
found_path=
package=

function echo_version() {
  echo $(cat $1 \
    | grep version \
    | head -1 \
    | awk -F: '{ print $2 }' \
    | sed 's/[", ]//g')
  }


# if no arg, consider current dir as a module
if [[ -z $1 ]]; then
  for path in "${p_root[@]}"; do
    if [[ -e $path ]]; then
      found_path=$path
      package="$path/$p_name"
      break 1
    fi
  done
# else find in node_modules
else
  for path in "${p_root[@]}"; do
    path="$path/node_modules/$1"
    if [[ -e $path ]]; then
      found_path=$path
      package="$path/$p_name"
      break 1
    fi
  done
fi

[[ -z $found_path ]] && exit 1

if [[ $2  == '-l' ]]; then
  [[ -L $found_path ]] && echo -n "l" || echo -n "d"
fi

echo_version $package
exit 0
