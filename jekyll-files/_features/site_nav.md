---
layout: default
title: Site Navigation
use_math: false
root: "../"
---

## Top bar navigation menu
To customise the navigation menu, you have to edit this file: 

{% highlight plain %}
AutoNOTE/
├─ _data/
   ├─ nav_menu.yml
{% endhighlight %}

The default file should look something like this:

{% highlight yaml %}
menu_title: Your Title Goes Here
menu_links:
  - title: Learn how to edit the menu
    url: features/nav_menu.html

  - title: Link 1
    url: #

  - title: Link 2
    url: #
{% endhighlight %}

Simply edit the `menu_title` and `menu_links` in the same fashion to custom the navigation menu for yourself. You can have as many or as few links as you'd like. 

## Front page navigation menu 

By default, the front page navigation is the same as the top bar navigation. However this can be customised in a number of ways. 

Firstly, if you input any collections into the `navigation` front matter, a list will replace the default layout. Below shows an example of how to add a list of all the pages in the 'features' collection. 

{% highlight liquid %}
{% raw %}
---
navigation:
  - features
---
{% endraw %}
{% endhighlight %}

Alternatively, you can fully customise the front page navigation by setting `use_custom_menu` to `true` as bellow

{% highlight liquid %}
{% raw %}
---
use_custom_menu: true
---
{% endraw %}
{% endhighlight %}

and editing the front-page-nav.yml file, found here:

{% highlight plain %}
AutoNOTE/
├─ _data/
   ├─ front-page-nav.yml
{% endhighlight %}