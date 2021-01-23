#!/bin/sh

p_root=("./front" ".")

# get the version from a package.json
# if arg, check in {p_root}/node_modules/arg
# otherwise check in {p_root}/package.json to get the current module version

p_name="package.json"

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
    package="$path/$p_name"
    if [[ -e $package ]]; then
      echo_version $package
      exit 0
    fi
  done
fi


for path in "${p_root[@]}"; do
  package="$path/node_modules/$1/$p_name"
  if [[ -e $package ]]; then
    echo_version $package
    exit 0
  fi
done
