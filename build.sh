#!/usr/bin/env bash

# all commands must exit 0
set -e

# clean build folder
rm -rf build/

# compile html
cp -r html/ build/
pug --obj "{basedir: '$PWD'}" build/
find build/ -type f -name *.pug -delete
find build/ -type f -name *.jade -delete
rm -r build/_templates/

# compile css
lessc --clean-css css/app.less build/app.css

# copy other files
cp CNAME build/
# cp favicon/favicon-196x196.png build/
cp -r fonts/social-fonts build/fonts/
