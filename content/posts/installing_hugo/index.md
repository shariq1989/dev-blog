---
title: "Installing Hugo in Linux (Ubuntu)"
date: 2021-03-20
tags:
  ["Hugo", "Development", "Blogging", "Ubuntu", "Linux"]
author: "Shariq Jamil"
draft: false
hidemeta: false
comments: false
description: "A quick and easy guide to installing Hugo static site generator on Linux or Ubuntu to build a blog"
cover:
  image: "<image path/url>" # image path/url
  alt: "<alt text>" # alt text
  caption: "<text>" # display caption under cover
  relative: false # when using page bundles set this to true
  hidden: true # only hide on current single page
---

To begin working on the blog, I needed to install Hugo first. My laptop runs [Pop_OS!](https://pop.system76.com/), a Linux distribution based on **Ubuntu**. There are quite a few ways to install Hugo and I chose to install the official package using **apt-get**.

    sudo apt-get install hugo

Once the install was complete, I verified the install

    hugo version

As shown in the screenshot below, Hugo version 0.74.3 installed successfully on my machine.

![regular](version.png)


