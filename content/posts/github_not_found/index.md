---
title: "GitHub 'repository not found' error when using an access token"
date: 2021-10-04
tags: ["GitHub", "Git", "Development"]
author: "Shariq Jamil"
draft: false
hidemeta: false
comments: false
description: "I was getting a repository not found error after getting a personal access token"
cover:
  image: "<image path/url>" # image path/url
  alt: "<alt text>" # alt text
  caption: "<text>" # display caption under cover
  relative: false # when using page bundles set this to true
  hidden: true # only hide on current single page
---

At my work we use Personal Access Tokens (PATs) to authenticate to a Github repository (as opposed to using a password).  I was having trouble cloning the repository and seeing the following error

![regular](error.jpg)

After browsing Stack Overflow posts, I realized that I didn't set the right "scopes" or permissions for my token. I generated a new token but this time I made sure to set all the scopes under "repo". After setting the appropriate scopes, I was able to access the repository with the new token. 

![regular](access_token.PNG)
