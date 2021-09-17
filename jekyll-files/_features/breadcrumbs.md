---
layout: default
title: Breadcrumbs
use_math: false
root: "../"
excerpt_separator: <!--more-->
---

{% include breadcrumbs %}

They can go anywhere in the page. Suitable for use in both page templates and specific page documents.
<!--more-->
## They're automatic...

...but there are some rules. Any folders must have a page of the same name in the parent directory, this page will be where the 
breadcrumb trail navigates to. 
<!--more-->

So, for example, this page is inside the 'features' folder. There should therefore be a 'features.html' page in the root directory. 
This top-level page should provide navigation to this page and other features. 

Maybe I will make a navigation template (instead of default) that takes a nav data set as an argument and generates a basic nav 
page - that way I can be lazy when I want to.

Now to just work out how navigation is going to work.