---
layout: default
title: Services
permalink: /services
---
<div class="container-xxl">
  <div class="row">
    <div class="col">
    <h2>{{ page.title }}</h2>
      <ul>
        {% for service in site.pages %}
          {% if service.path contains 'services/' %}
          <div class="card mb-3">
          <div class="row g-0">
              <div class="col-md-3">
              <img width="320px" src="{{ service.list-image }}" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-9">
              <div class="card-body">
                  <h5 class="card-title"><a href="{{ service.url }}">{{ service.title }}</a></h5>
                  <p class="card-text">{{ service.description }}</p>
              </div>
              </div>
          </div>
          </div>
          {% endif %}
        {% endfor %}
      </ul>
    </div>
  </div>
</div>