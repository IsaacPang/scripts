#!/usr/bin/env bash
# adapted from blog text https://khalilstemmler.com/blogs/typescript/node-starter-project/
# USAGE:
#       Execute file to create a typescript projec with basic installations and configs, including:
#               1. nodemon      - for dev cold reloading
#               2. rimraf       - for production builds
#               3. jest         - for testing
#
# OPTIONS:
#       -n      Sets folder and project name
#
# NOTES:
#       1. This is not portable: only works for BSD/macOS, as sed has different implementations
#       2. Remember to chmod +x <this_file_name> to ensure executability

# retrieve cli inputs
name=""
while getopts "n:" options
do
  case "${options}" in
    n) name=${OPTARG};;
  esac
done

# set default folder name
[ -z $name ] && name="typescript_project"

# initial setup
mkdir $name
cd $name

# setup initial npm package
npm init -y

# add typescript as a dev dependency
npm i typescript --save-dev

# install ambient nodejs types as dev dependencies
npm i @types/node --save-dev

# create tsconfig.json
# set root directory to ./src/
# set build directory to ./build/
# set commonjs intermodules to true
# if we use json as modules, set to true
# use es6 compiled down to target es5
# use commonjs as the standard module system
# allow js compatibility
# no implicit any types allowed, all must be specified
npx tsc --init --rootDir src --outDir build --esModuleInterop --resolveJsonModule --lib es6 --module commonjs --allowJs true --noImplicitAny true

# delete all purely commented files in tsconfig
sed -i '' -E -e '\#^[ \t]*/\*|^[ \t]*//|^[ \t]*$#d' tsconfig.json  # delete lines starting with /*, // and blank lines
sed -i '' -e 's/\/\*.*$//g' tsconfig.json                          # remove all remaining comments in each line
sed -i '' -e 's/[ \t]*$//g' tsconfig.json                          # remove all trailing white spaces in each line

# create src folder
mkdir src
touch src/index.ts

# cold reloading using nodemon and ts-node
npm i nodemon ts-node --save-dev
echo '{' > nodemon.json
sed -i '' -e '$ a\
  "watch": ["src"],' nodemon.json
sed -i '' -e '$ a\
  "ext": ".ts.js",' nodemon.json
sed -i '' -e '$ a\
  "ignore": [],' nodemon.json
sed -i '' -e '$ a\
  "exec": "npx ts-node ./src/index.ts"' nodemon.json
sed -i '' -e '$ a\
}' nodemon.json
sed -i '' -e '/scripts/ a\
    "dev": "npx nodemon",' package.json

# creating production scripts
npm i rimraf --save-dev
sed -i '' -e '/npx nodemon/ a\
    "build": "rimraf ./build && tsc",' package.json

# production startup script
sed -i '' -e '/"rimraf .\/build && tsc"/ a\
    "start": "npm run build && node build/index.js",' package.json

# tests
npm i jest --save-dev
sed -i '' -e '/"test": /d' package.json
sed -i '' -e '/npm run build/ a\
    "test": "jest"' package.json
