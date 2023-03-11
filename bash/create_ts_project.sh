# adapted from blog text
# https://khalilstemmler.com/blogs/typescript/node-starter-project/
# note that this works for BSD/macOS, as sed works a little differently:
# -i requires no extension (-i'' )

# initial setup
mkdir typescript_project
cd typescript_project

# setup initial npm package
npm init -y

# add typescript as a dev dependency
npm i typescript --save-dev

# install ambient nodejs types as dev dependencies
npm i @types/node --save-dev

# create tsconfig.json
# set root directory to ./src/, build directory to ./build/
# set commonjs intermodules to true
# if we use json as modules, set to true
# use es6 compiled down to target es5
# use commonjs as the standard module system
# allow js compatibility
# no implicit any types allowed, all must be specified
npx tsc --init --rootDir src --outDir build \
--esModuleInterop --resolveJsonModule --lib es6 \
--module commonjs --allowJs true --noImplicitAny true

# delete all purely commented files in tsconfig
sed -i'' -e '/^[ \t]*\/\*/d' tsconfig.json  # delete line starting with /*
sed -i'' -e '/^[ \t]*\/\//d' tsconfig.json  # delete line starting with //
sed -i'' -e '/^[ \t]*$/d' tsconfig.json     # delete blank lines

# create src folder
mkdir src
touch src/index.ts

# cold reloading
npm i nodemon ts-node --save-dev
touch nodemon.json
sed '1 i {\n  "watch": ["src"],\n  "ext": ".ts,.js",\n  "ignore": [],\n  "exec": "npx ts-node ./src/index.ts"\n}' nodemon.json
sed '/scripts/ i \\  "scripts": {\n    "dev": "npx nodemon",\n  }' package.json

# creating production scripts
npm i rimraf --save-dev
sed '/npx nodemon/ a \\    "build": "rimraf ./build && tsc",'

# production startup script
sed '/rimraf/ a \\    "start": "npm run build && node build/index.js"'
