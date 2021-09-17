---
layout: default
title: Equations
use_math: true
root: "../"
---

To enable equations for a given page, you must set `use_math` to `true` in the page's front matter. For example, this page's front matter appears as follows:

{% highlight liquid %}
{% raw %}
---
layout: default
title: Equations Demo
use_math: true
---
{% endraw %}
{% endhighlight %}

Equation support is built directly into AutoNOTE 2. With these tools, it is simple to add both inline or block-centered equations using the familiar LaTeX maths commands. In both cases, the equations are denoted using the `$$` command in the markdown files.

## Inline Equations
To implement an inline equation you can simply include the equation inline with some text, as follows:

{% highlight liquid %}
{% raw %}
Some inline LaTeX: $$a^2 + b^2 = c^2$$
{% endraw %}
{% endhighlight %}

Any equation will render as an inline equation unless there is a blank line above the equation block. The above code yields the following result:

Some inline LaTeX: $$a^2 + b^2 = c^2$$

## Display Equation
There are two different ways to implement a standard centered equation. While the first is easy to recall and implement, the second allows far greater control over the final result.

### Method 1 - White Space
First, you can simply use the inline notation on a new line, as follows (note the black line above the equation is required):

{% highlight liquid %}
{% raw %}
The following equation is displayed as a centered block. 
This is thanks to the empty line between this sentence and the equations definition.

$$\int e^{-kx} \, dx = -\frac{1}{k} e^{-kx}$$
{% endraw %}
{% endhighlight %}

If used in a page, this command would yield the following results:

The following equation is displayed as a centered block. 
This is thanks to the empty line between this sentence and the equations definition.

$$\int e^{-kx} \, dx = -\frac{1}{k} e^{-kx}$$

This method does not support equation numbering or cross referencing.

### Method 2 - Full Equation Block

The second method is really just an expansion of the first. As before we use the `$$` special characters to activate the equation parser (note that without these markers the system will often still appear to work - however, here be dragons). We may use any of the standard LaTeX equation commands and syntax, for example:

{% highlight liquid %}
{% raw %}
$$
\begin{equation}
\begin{split}
   (x+1)^2 &= (x+1)(x+1)\\
           &= x^2 + 2x + 1
\end{split}
\end{equation}
\label{eq:exampleEquation}
$$
{% endraw %}
{% endhighlight %}

The above example makes use of the `equation`, `label` and `split` blocks from LaTeX. The `equation` block will cause the equation to be numbered, allowing the document to reference the equation via it's `label` using the command `\eqref{eq:exampleEquation}`. The `split` command acts to divide the equation between two lines, aligning the `=` signs accordingly. This code yields the result shown below in Equation \eqref{eq:exampleEquation}.

$$
\begin{equation}
\begin{split}
   (x+1)^2 &= (x+1)(x+1)\\
           &= x^2 + 2x + 1
\end{split}
\end{equation}
\label{eq:exampleEquation}
$$

It is important to note that the `label` command is not in the usual place in the above example but rather comes after the `equation` block. This, sadly, is a key difference between the AutoNOTE 2 and LaTeX syntax. Labels must come after the block that they are to point to (unlike LaTeX). In this case following either the `split` or `equation` block would do.

## The Align Block

As in LaTeX, the Align block may be used to number each line separately or to specify which equations in a group are numbered. The `\nonumber` or `\notag` commands are used to skip numbering specific lines. For example:

{% highlight liquid %}
{% raw %}
$$
\begin{align}
   (x+1)^2 &= (x+1)(x+1) \nonumber \\ \label{eq:squareA}
           &= x^2 + 2x + 1 \\
           &= \frac{1}{2}(x+1)(2x+2) \notag \\ \label{eq:squareB}
           &= \frac{1}{(x+1)^{-2}}
\end{align}
$$
{% endraw %}
{% endhighlight %}

Once again, the `label` tag comes after the equation that it points to. This makes it possible to reference specific lines in an equation group, as shown in Equations \eqref{eq:squareA} and \eqref{eq:squareB}.

$$
\begin{align}
   (x+1)^2 &= (x+1)(x+1) \nonumber \\ \label{eq:squareA}
           &= x^2 + 2x + 1 \\
           &= \frac{1}{2}(x+1)(2x+2) \notag \\ \label{eq:squareB}
           &= \frac{1}{(x+1)^{-2}}
\end{align}
$$

# Some further examples

You can view the original source markdown for this document in '_features/equations.md'. It is easy to reference variables in markdown, such as $x$, $y$, $x_1$ and $y_1$.
You can even use special characters like $\|\psi\rangle$, $x'$, $x^\*$, however some need escaping with `\`. 

Just like in LaTeX, you can use `equation*` or `align*` blocks to stop the system from numbering the equations.

$$
  \begin{align*}
    |\psi_1\rangle &= a|0\rangle + b|1\rangle \\
    |\psi_2\rangle &= c|0\rangle + d|1\rangle
  \end{align*}
$$

Finally, more complex equations are supported, as shown in equitation \eqref{eq:twodmat}.

$$
\begin{equation}
A_{m,n} = 
\begin{pmatrix}
a_{1,1} & a_{1,2} & \cdots & a_{1,n} \\
a_{2,1} & a_{2,2} & \cdots & a_{2,n} \\
\vdots  & \vdots  & \ddots & \vdots  \\
a_{m,1} & a_{m,2} & \cdots & a_{m,n} 
\end{pmatrix}
\label{eq:twodmat}
\end{equation}
$$

Here is another example, testing the various different styles of matrices supported by the system.

$$
\begin{matrix} 
a & b \\
c & d 
\end{matrix}
\quad
\begin{pmatrix} 
a & b \\
c & d 
\end{pmatrix}
\quad
\begin{bmatrix} 
a & b \\
c & d 
\end{bmatrix}
\quad
\begin{vmatrix} 
a & b \\
c & d 
\end{vmatrix}
\quad
\begin{equation}
\begin{Vmatrix} 
a & b \\
c & d 
\end{Vmatrix}
\end{equation}
$$