# build site
echo "------Building site------------------"
hugo -D
# wipe previous version of site
echo "------Deleting previous version------"
rm -rf ../../shariq1989.github.io/*
# copy over new version
echo "------Copying over new version-------"
cp -r ./public/* ../../shariq1989.github.io/
# push changes
echo "------Pushing changes----------------"
cd ../../shariq1989.github.io
git add *
git commit -m "new version"
git push
