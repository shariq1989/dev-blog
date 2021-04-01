---
title: "Smarter image optimization"
date: 2021-03-31
tags:
  ["Hugo", "Development", "Blogging", "Bash", "Scripting", "Image Optimization"]
author: "Shariq Jamil"
draft: false
hidemeta: false
comments: false
description: "I improved the image optimization script for my blog. Large images will now be found and moved automatically"
cover:
  image: "<image path/url>" # image path/url
  alt: "<alt text>" # alt text
  caption: "<text>" # display caption under cover
  relative: false # when using page bundles set this to true
  hidden: true # only hide on current single page
---

This blog has been a nice source of motivation to continue improving my code and development processes. [In my previous post]({{< ref "/posts/optimizing_images" >}}), I discussed the process of writing a Bash script to resize and optimize images for publishing to our family's [recipe blog](https://www.jamilghar.com). I mentioned that one improvement I could make is to automate the process of identifying which files needed to be resized. 

## The original script

I place large images into the "optimize" directory which are then backed up and processed when I run the following script. I have to do this every time new images are added to the blog (2-5 times a week)

    # This script optimizes and resizes any images in the optimize directory 
    # backup images
    cp *.jpg ../../backup/
    # remove file data, optimize file to reduce space
    jpegoptim *.jpg --strip-all
    # reduce size
    mogrify -resize 20% *.jpg
    # move back to images dir
    mv *.jpg ../
    # push changes
    echo "------Pushing changes----------------"
    # navigate out to root directory
    cd ../../..
    git add *
    git commit -m "optimized images"
    git push

## Automate

In my experience, process automation has looked something like the following 

1. Identify the manual process
2. Write down the rules
3. Automate the process based on the rules from **step 2**
4. Compare the **input(s)** and **output(s)** from the original process to those from the automated process
5. If there is a difference found in **step 4**, go back to **step 2**

We followed this process when automating price quoting for a global shipping company. We were going to replace a large call center with a web service. It was tough to nail down because people and relationships were involved. Certain vendors had longstanding relationships with call centers. Prices didn't always follow a mathematical equation. 

Automation required that we had to draw a line somewhere, come up with that equation and stick to it. Custom discounts could be coded in, as well. The process led to more transparency and higher sales.  

## The improvement

For my script, the rule was **any JPG greater than 1 MB in the images directory**. Instead of me moving the files, the script would identify files that match these criteria and move them for me.   

I added the following code to automate the moving process. I no longer have to take any steps apart from running the script. This means that the script can now be run periodically ([cron job](https://opensource.com/article/17/11/how-use-cron-linux)) or be triggered as part of [continuous integration](https://circleci.com/continuous-integration/).  

    # move any JPG files larger than 1 MB to optimize dir
    find . -maxdepth 1 -type f -size +1M -name '*.jpg' -exec mv {} optimize/ \;

