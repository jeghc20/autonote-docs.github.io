---
layout: default
title: Desmos Embed
use_math: false
root: "../"
---

Sometimes, you may wish to embed desmos in your page. With AutoNOTE 2 this is achieved through a single command:

{% highlight liquid %}
{% raw %}
{% include desmos id='6veqfz3k0h' %}
{% endraw %}
{% endhighlight %}

If you don't want the graph to be interactive, simply add `static='true'` as follows:
{% highlight liquid %}
{% raw %}
{% include desmos id='6veqfz3k0h' static='true'%}
{% endraw %}
{% endhighlight %}

Simply replace the `id` parameter with the ID of your desired desmos graph. This is dynamic graph:
{% include desmos id='6veqfz3k0h' static='false'%}
This is the same graph but with `static='true'`:
{% include desmos id='6veqfz3k0h' static='true'%}

When using this command, the graph is a full width embedded iframe.