---
layout: default
title: Images
use_math: false
root: "../"
---

To include images in your pages, first you must add them to the images folder.

{% highlight plain %}
AutoNOTE/
├─ images/
   ├─ ...
{% endhighlight %}

After that, they can be added to your page with the below command. You can also add an image caption and alternative image text. If you do not give alternative text, this defaults to the image caption. 

{% highlight liquid %}
{% raw %}
{% include image file="cute_dog.png" caption="This is a custom caption for the image." alt="Image alternative text"%}
{% endraw %}
{% endhighlight %}

## Sizes
To customise the image size, set the `size` parameter to `sm`, `md` or `lg` - the default is medium. If these sizes aren't right for you, set the `size-custom` parameter from `1-12`, 1 being the smallest and 12 being full width. Here are some examples:


{% highlight liquid %}
{% raw %}
{% include image file="cute_dog.png" size="sm" caption="Small (sm) image."%}
{% endraw %}
{% endhighlight %}

{% include image src = "https://via.placeholder.com/600x450" file="dog.jpeg" caption="Small (sm) image." alt="Image alternative text" size="sm"%}

{% highlight liquid %}
{% raw %}
{% include image file="cute_dog.png" size="md" caption="Medium (md) image."%}
{% endraw %}
{% endhighlight %}

{% include image src = "https://via.placeholder.com/600x450" file="dog.jpeg" caption="Medium (md) image." alt="Image alternative text" size="md"%}

{% highlight liquid %}
{% raw %}
{% include image src = "https://via.placeholder.com/600x450" file="cute_dog.png" size="lg" caption="Large (lg) image."%}
{% endraw %}
{% endhighlight %}

{% include image src = "https://via.placeholder.com/600x450" file="dog.jpeg" caption="Large (lg) image." alt="Image alternative text" size="lg"%}

{% highlight liquid %}
{% raw %}
{% include image file="cute_dog.png" size-custom=2 caption="Custom size 2."%}
{% endraw %}
{% endhighlight %}

{% include image src = "https://via.placeholder.com/600x450" file="dog.jpeg" caption="Custom size 2." alt="Image alternative text" size-custom=2%}

{% highlight liquid %}
{% raw %}
{% include image file="cute_dog.png" size-custom=5 caption="Custom size 5."%}
{% endraw %}
{% endhighlight %}

{% include image src = "https://via.placeholder.com/600x450" file="dog.jpeg" caption="Custom size 5." alt="Image alternative text" size-custom=5%}
## Positions

To change the position of the image, simply set the `position` parameter to `left` or `right` - middle is the default.  Here are some examples: 

{% highlight liquid %}
{% raw %}
{% include image file="cute_dog.png" position="left"%}
{% endraw %}
{% endhighlight %}

{% include image src = "https://via.placeholder.com/600x450" file="dog.jpeg" caption="Cute dog on the left." alt="Image alternative text" position="left"%}

{% highlight liquid %}
{% raw %}
{% include image file="cute_dog.png"%}
{% endraw %}
{% endhighlight %}

{% include image src = "https://via.placeholder.com/600x450" file="dog.jpeg" caption="Cute dog on the right." alt="Image alternative text"%}

{% highlight liquid %}
{% raw %}
{% include image file="cute_dog.png" position="right"%}
{% endraw %}
{% endhighlight %}

{% include image src = "https://via.placeholder.com/600x450" file="dog.jpeg" caption="Cute dog on the right." alt="Image alternative text" position="right"%}