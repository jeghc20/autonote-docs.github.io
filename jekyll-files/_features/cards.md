---
layout: default
title: Cards
use_math: false
root: "../"
---

You can add cards to highlight sections of text and make pages more interactive. Buttons with collapsible sections can be embedded within cards - these are good for question hints or answers! An example of this can be seen below:

{% highlight liquid %}
{% raw %}

{% card %}
### This is a card

What can I do with it?

{% button Answer %}

Embed any markdown or code snippets like usual

{% endbutton %}

{% endcard %}


{% endraw %}
{% endhighlight %}




{% card %}
### This is a card

What can I do with it?

{% button Answer %}

Embed any markdown or code snippets like usual

{% endbutton %}

{% endcard %}

<br/>

{% card %}
You can put anything in a card, even sections of code!

{% highlight python %}
{% raw %}
print("Hello Cards!")
{% endraw %}
{% endhighlight %}

{% card %}
Or another card.



{% card %}
Or another...

{% endcard %}

{% endcard %}


{% endcard %}

<br/>