#!/usr/bin/env bash
cd static/img/_original 
find . -maxdepth 1 -iname "*.jpg" | xargs -L1 -I{} convert -resize 50% "{}" "{}.rsz"
mv *.rsz ../
cd ..
rm -f *.jpg
rename -v 's/.rsz//' *
rm -f *.rsz
cd ../..
hugo
cd public
surge .
cd ..
git add -A
git commit -m "update $(date)"
git push