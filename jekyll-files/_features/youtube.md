---
layout: default
title: YouTube Embed
use_math: false
root: "../"
---

Sometimes, you may wish to include a YouTube video in your page. With AutoNOTE 2 this is achieved through a single command:

{% highlight liquid %}
{% raw %}
{% include youtube id='wshaL7DdiL4' %}
{% endraw %}
{% endhighlight %}

Simply replace the `id` parameter with the ID of your desired YouTube video and it will appear as follows:
{% include youtube id='wshaL7DdiL4' %}

When using this command, the video is a full width responsive embedded iframe as per the YouTube embed guidance.