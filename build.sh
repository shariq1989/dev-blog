# build site
hugo -D
# wipe previous version of site
rm -rf ../../shariq1989.github.io/*
# copy over new version
cp -r ./public/* ../../shariq1989.github.io/*
# push changes
cd ../../shariq1989.github.io
git add *
git commit -m "new version"
git push
