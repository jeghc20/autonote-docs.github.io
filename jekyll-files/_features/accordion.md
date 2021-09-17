---
layout: default
title: Accordions
use_math: false
root: "../"
---

The accordion is a useful way to pack lots of optional or easily grouped information into manageable sections that may be hidden or shown as the user requires. This helps reduce the page length, giving the reader the ability to open and close different explanatory sections, while helping to keep text close to code snippets or images.

## Creating an accordion
To add an accordion to your page, you must simply use the following custom Liquid blocks in the page's markdown file:

{% highlight liquid %}
{% raw %}
{% accordion %}
{% bellows Title of a Collapsible %}
First bellows content.
{% endbellows %}

{% bellows A Second Collapsible %}
# Second

More bellows content
{% endbellows %}

{% bellows Another One? %}
Third bellows content.
1. Which
2. is
3. markdown
{% endbellows %}
{% endaccordion %}
{% endraw %}
{% endhighlight %}

It's worth noting that Liquid (and therefore Jekyll) doesn't support indentation This will yield the following accordion block:
{% accordion  %}
{% bellows Title of a Collapsible %}
First bellows content.
{% endbellows %}

{% bellows A Second Collapsible %}
# Second

More bellows content
{% endbellows %}

{% bellows Another One? %}
Third bellows content.
1. Which
2. is
3. markdown
{% endbellows %}
{% endaccordion %}
 
## Options and extras
It is also possible to state which of the bellows collapsibles is open by default. To do this, simply pass the index of the bellows you wish to have open (starts at 1) as an argument. For example, if we wished for the second bellows to be open on page load, we could use the following:

{% highlight liquid %}
{% raw %}
{% accordion 2 %}

{% bellows First Collapsible %}
This collapsible should be hidden by default on loading the page.
{% endbellows %}

{% bellows Second Collapsible %}
This collapsible should be visible by deafult on loading the page.
{% endbellows %}

{% bellows Third Collapsible %}
This collapsible should be hidden by default on loading the page.
{% endbellows %}
{% endaccordion %}
{% endraw %}
{% endhighlight %}

This code would yield the following result:
{% accordion 2 %}

{% bellows First Collapsible %}
This collapsible should be hidden by default on loading the page.
{% endbellows %}

{% bellows Second Collapsible %}
This collapsible should be visible by deafult on loading the page.
{% endbellows %}

{% bellows Third Collapsible %}
This collapsible should be hidden by default on loading the page.
{% endbellows %}
{% endaccordion %}