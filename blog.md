---
layout: default
title: Blog
permalink: /blog
---
<div class="container-xxl">
  <div class="row">
    <div class="col">
      <h1>{{ page.title }}</h1>
      <ul>
        {% for post in site.posts %}
          <div class="card mb-3">
          <div class="row g-0">
              <div class="col-md-3">
              <img src="{{ post.list-image }}" class="img-fluid rounded-start" alt="{{ post.title }}">
              </div>
              <div class="col-md-9">
              <div class="card-body">
                  <h5 class="card-title"><a href="{{ post.url }}">{{ post.title }}</a></h5>
                  <p class="card-text">{{ post.description }}</p>
                  <p class="card-text"><small class="text-body-secondary">Published on: {{ post.date | date: "%B %d, %Y" }}</small></p>
              </div>
              </div>
          </div>
          </div>
        {% endfor %}
      </ul>
    </div>
  </div>
</div>