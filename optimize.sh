# This script optimizes and resizes images
# Usage example: sh ./optimize.sh posts/biking/
# navigate out to the images directory
echo "------Parameter check----------------"
if [ -z "$1" ]; then
	echo "Please provide image directory"
	exit 1
fi

echo "------Move to specified directory----------------"
cd $1
echo "------Are there files to modify?----------------"
count=$(ls -1 *.jp*g 2>/dev/null | wc -l)
if [ $count != 0 ]; then
	# backup images
	echo "------Yes, backing up large files----------------"
	find . -maxdepth 1 -type f -name "*.jp*g" -exec cp --verbose {} ~/Documents/Development/myblog/dev-blog/static/images/backups/ \;
	mogrify -auto-orient -verbose -filter Triangle -define filter:support=2 -thumbnail 1200 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB *.jp*g
	# push changes
	echo "------Pushing changes is disabled for now----------------"
	# navigate out to root directory
	cd ~/Documents/Development/myblog/dev-blog
#	git add *
#	git commit -m "optimized images"
#	git push
else
	echo "------No images to optimize, aborting----------------"
fi
