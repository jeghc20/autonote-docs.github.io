---
layout: default
title: Code Highlighting
use_math: false
root: "../"
---

AutoNOTE 2 uses a Rouge highlighter to provide effective code formatting. There are two distinct versions of code highlighting:
1. Inline code or keywords.
2. Code snippets.

The AutoNOTE highlighter has some additional features and options, detailed in the document below.

## Inline Keywords

You can `highlight` keywords in a body of text using the tick symbol, for example this sentence was generated using:
{% highlight liquid %}
{% raw %}
You can `highlight` keywords in a body of text.
{% endraw %}
{% endhighlight %}

## Code snippets

Code snippets are generated using the `highlight` command. For example:
{% highlight liquid %}
{% raw %}
{% highlight python %}
# Start with a comment.
def HelloWorld():
  message = 'Hello World'
  print(message) # Prints the message 'Hello World' to the terminal
  return 0
{% endhighlight %}
{% endraw %}
{% endhighlight %}

As shown in this example, the programming language (python) is provided as an argument to ensure that the syntax highlighting is processed correctly.
This yields the following result:
{% highlight python %}
# Start with a comment.
def HelloWorld():
  message = 'Hello World'
  print(message) # Prints the message 'Hello World' to the terminal
  return 0
{% endhighlight %}

### Optional arguments

#### linenos - Line numbering

#### startline - Numbering start count

#### enddots

#### noselect

{% highlight liquid %}
{% raw %}
{% highlight python linenos startline=3 enddots noselect %}
# Start with a comment.
def HelloWorld():
  message = 'Hello World'
  print(message) # Prints the message 'Hello World' to the terminal
  return 0
{% endhighlight %}
{% endraw %}
{% endhighlight %}

{% highlight python linenos startline=3 enddots noselect %}
# Start with a comment.
def HelloWorld():
  message = 'Hello World'
  print(message) # Prints the message 'Hello World' to the terminal
  return 0
{% endhighlight %}

### Coming soon

- Filename argument

{% highlight python %}
{% include hello.py %}
{% endhighlight %}

Todo: Explore custom include folder.