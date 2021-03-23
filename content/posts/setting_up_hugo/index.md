---
title: "Start blogging with Hugo"
date: 2021-03-22
tags:
  ["hugo", "development", "blog"]
author: "Shariq Jamil"
draft: false
hidemeta: false
comments: false
description: "A quick and easy guide on setting up Hugo, picking a theme, adding content and writing a blog on Hugo"
cover:
  image: "<image path/url>" # image path/url
  alt: "<alt text>" # alt text
  caption: "<text>" # display caption under cover
  relative: false # when using page bundles set this to true
  hidden: true # only hide on current single page
---

## Create a Hugo site

After installing Hugo, I was ready to start on the blog. I have a directory (or "folder" for Windows folks) on my laptop for software development projects. Most of these projects are also hosted in my [Github](https://github.com/shariq1989) account. 

I navigated to that directory and created a folder called **food-blog**. Inside **food-blog**, I ran Hugo's command to start a new site.

    hugo new site food-blog

In the screenshot below, you can see that the new Hugo site was created successfully. 

![regular](new_site.png)

You may wonder why I created the Hugo site inside a directory with the same name (**food-blog/food-blog**). This is because I like to store files that I do not want to check in to version control in this root directory. If you want to avoid this pattern, you can have these files in the Hugo site root and added to the **.gitignore** file.  

# Choose a Theme

As suggested by Hugo when you created the new site, you may now look for and implement a theme. Hugo has an [extensive collection of themes](https://themes.gohugo.io/) available for free. Each will have its own set of instructions for set up and configuration. Not all themes offer the same features, so it is good to think about the functionality you need in your site. Other factors I consider when choosing a theme are
- Number of stars on Github
- Open issues on Github
- Time since last commit
- Testing/QA

These factors will indicate how well-maintained the theme is. If you have an issue down the road, you will want the theme's maintainer to be engaged. The number of stars show the theme's popularity - if its used enough, chances are that quite a few issues have already been addressed and that there is a larger pool of contributors. Testing/QA help ensure that new commits do not include vulnerabilities and do not break existing functionality.

Two well-supported and feature-rich themes that I like are [Anatole](https://themes.gohugo.io/anatole/) and [PaperMod](https://themes.gohugo.io/hugo-papermod/). You can make changes to a theme to support your use-case, so it's fine to choose a theme that losely provides the structure you want.

![regular](anatole.png "JamilGhar uses the Anatole theme")

![regular](thistheme.png "This site uses the PaperMod theme")

## Install the Theme
To begin installing the theme, navigate to the newly created Hugo site's root directory. Now you can initialize the Git repository here and pull down the theme as a submodule.

    git init
    git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
