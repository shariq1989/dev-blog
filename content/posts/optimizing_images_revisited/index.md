---
title: "Optimizing images revisited"
date: 2021-09-27
tags:
  ["Hugo", "Development", "Blogging", "Bash", "Scripting", "Image Optimization"]
author: "Shariq Jamil"
draft: false
hidemeta: false
comments: false
description: "A faster and robust script for optimizing image size and quality for blogs, posting on the web or on static site generators"
cover:
  image: "<image path/url>" # image path/url
  alt: "<alt text>" # alt text
  caption: "<text>" # display caption under cover
  relative: false # when using page bundles set this to true
  hidden: true # only hide on current single page
---

One of the most important workflows for our food recipe blog ([JamilGhar](https://www.jamilghar.com)) is image optimization. My wife uploads images to our GitHub repository and, when prodded, I run a bash script that decreases image sizes and removes extraneous information from the files. The script is a constant work in progress and I have a few posts ([1]({{< ref "/posts/optimizing_images" >}}),[2]({{< ref "/posts/find_move" >}})) about it on here. 

Lately, I have been considering downloading the repository on a Raspberry Pi and running the script as a scheduled job. For that to happen, the job would have to run without errors. My updates today have been a step in that direction. 

## Simplified .jpg/.jpeg logic
I was handling **.jpg** and **.jpeg** files separately. It feels like a naive decision now because the code is less complicated and wordy now just by changing the references to **\*.jp\*g** (which can handle either format).

    # changed this
    find . -maxdepth 1 -type f -size +1M \( -iname \*.jpg -o -iname \*.jpeg \) -exec mv {} optimize/ \;
    # to this
    find . -maxdepth 1 -type f -size +1M -name "*.jp*g" -exec mv {} optimize/ \;

## Terminated job if no images are found
Since running the script was a manual process, I manually verified (or assumed) that there were files to be optimized. This procedure is not fail-safe and would not be suitable for an automated solution.

For this reason, I added an if-else block where I check for optimization candidates before running any operations. 

    count=`ls -1 *.jp*g 2>/dev/null | wc -l`
    if [ $count != 0 ]
    then
    ... 

## Complete script

Undoubtedly, there are more changes to come in this script. For now, this feels enough for my purposes. 

    # This script optimizes and resizes any images in the 'optimize' directory 
    # navigate out to the images directory
    echo "------Navigating to images dir----------------"
    cd ..
    # move any JPG files larger than 1 MB to optimize dir
    echo "------Finding large files and moving them to optimize dir----------------"
    find . -maxdepth 1 -type f -size +1M -name "*.jp*g" -exec mv {} optimize/ \;
    # go back to optimize dir
    echo "------Navigating to optimize dir----------------"
    cd optimize/

    echo "------Are there files to modify?----------------"
    count=`ls -1 *.jp*g 2>/dev/null | wc -l`
    if [ $count != 0 ]
    then 
        # backup images
        echo "------Yes, backing up large files----------------"
        find . -maxdepth 1 -type f -name "*.jp*g" -exec cp {} ../../backup/ \;
        # remove file data, optimize file to reduce space
        echo "------Using jpegoptim to strip information----------------"
        jpegoptim *.jp*g --strip-all
        # reduce size
        echo "------Using mogrify to resize----------------"
        mogrify -resize 20% *.jp*g
        # move back to images dir
        echo "------Staging new images----------------"
        find . -maxdepth 1 -type f -name "*.jp*g" -exec mv {} ../ \;
        # push changes
        echo "------Pushing changes----------------"
        # navigate out to root directory
        cd ../../..
        git add *
        git commit -m "optimized images"
        git push
    else
        echo "------No images to optimize, aborting----------------"
    fi 