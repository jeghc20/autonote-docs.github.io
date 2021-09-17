---
layout: default
title: Panopto Embed
use_math: false
root: "../"
---

Sometimes, you may wish to include a Panopto video in your page. With AutoNOTE 2 this is achieved through a single command:

{% highlight liquid %}
{% raw %}
{% include panopto id='1064c46d-83e2-4b78-939b-ac47011ede1e' %}
{% endraw %}
{% endhighlight %}

Simply replace the `id` parameter with the ID of your desired Panopto video (you can get this from the address of the video in question) and it will appear as follows:
{% include panopto id='1064c46d-83e2-4b78-939b-ac47011ede1e' %}

When using this command, the video is a full width responsive embedded iframe.