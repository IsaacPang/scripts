# adapted from blog text
# https://khalilstemmler.com/blogs/typescript/node-starter-project/
# note that this works for BSD/macOS, as sed has different implementations

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
npx tsc --init \
        --rootDir src \                 # set root directory to ./src/
        --outDir build \                # set build directory to ./build/
        --esModuleInterop \             # set commonjs intermodules to true
        --resolveJsonModule \           # if we use json as modules, set to true
        --lib es6 \                     # use es6 compiled down to target es5
        --module commonjs \             # use commonjs as the standard module system
        --allowJs true \                # allow js compatibility
        --noImplicitAny true            # no implicit any types allowed, all must be specified

# delete all purely commented files in tsconfig
sed -i '' -E -e '\#^[ \t]*/\*|^[ \t]*//|^[ \t]*$#d' tsconfig.json  # delete lines starting with /*, // and blank lines
sed -i '' -e 's/\/\*.*$//g' tsconfig.json                          # remove all remaining comments in each line
sed -i '' -e 's/[ \t]*$//g' tsconfig.json                          # remove all trailing white spaces in each line

# create src folder
mkdir src
touch src/index.ts

# cold reloading
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
sed -i '' -e '/rimraf/ a\
    "start": "npm run build && node build/index.js",' package.json
