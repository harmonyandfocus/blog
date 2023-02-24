#! /bin/bash

JEKYLL_ENV=production jekyll build --destination _ipfs/

cd _ipfs

all-relative

cd ..

find _ipfs -type f -name "*.html" -print0 | xargs -0 sed -i '' -e 's/\/assets/assets/g'

find _ipfs -type f -name "*.html" -print0 | xargs -0 sed -i '' -e 's/src\=\"\/app.js/src\="app.js/g'

ipfs add -r --cid-version 1 _ipfs

