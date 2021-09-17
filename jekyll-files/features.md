---
layout: default
title: Features
sub-title: Documentation and examples of all AutoNOTE features.
use_math: false
root: "../"
---

Just a test for breadcrumb navigation. At some point soon this page should contain navigation to all feature pages... hopefully.

<ul>
{% for page in site.features %}
  <li>
    <a href=".{{page.url}}">{{page.title}}</a>
    <!-- <p>{{page.excerpt}}</p> -->
  </li>
{% endfor %}
</ul>