---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
---

<div class="container-xxl">
    {% assign latest_post = site.posts[0] %}
    <div class="row">
        <div class="col-md-4"><img src="{{ latest_post.list-image }}" class="img-fluid"></div>
        <div class="col-md-8">
            <h2><a href="{{ latest_post.url }}">{{ latest_post.title }}</a></h2>
            <div>{{ latest_post.description }}</div>
        </div>
    </div>
    <hr>
    <div class="row">
        {% assign recent_posts = site.posts | slice: 1, 6 %}
        {% for post in recent_posts %}
            <div class="col-md-4 text-center">
                <img width="320px" src="{{ post.list-image }}" class="img-fluid"><br>
                <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
            </div>
        {% endfor %}
    </div>
    <div class="row">
        <div class="col text-center">Read more <a href="/blog">case studies and articles</a></div>
    </div>
</div>
<div class="bg-dark-subtle full-screen">
    <div class="container-xxl">
        <div class="row text-center">
            <div class="col-md-4"><h2><a href="">Drupal<br>Development</a></h2></div>
            <div class="col-md-4"><h2><a href="">Continuous<br>Integration</a></h2></div>
            <div class="col-md-4"><h2><a href="">YouTube Video<br>Production Services</a></h2></div>
        </div>
    </div>
</div>
<div class="container-xxl">
    <div class="row">
        <div class="col-4 d-flex justify-content-center">
            <div class="card text-center" style="width: 18rem;">
                <img src="https://www.xandermar.com/assets/CU2NF0Jz5pI.jpg" class="card-img-top" alt="Drupal Consulting">
                <div class="card-body">
                    <h5 class="card-title">
                        <a class="btn btn-primary" href="/services/drupal-development-and-consulting">Drupal Consulting
                        </a>
                    </h5>
                    <p class="card-text">
                        Drupal website setup and deployment with custom front-end and back-end development.
                    </p>
                </div>
            </div>
        </div>
        <div class="col-4 d-flex justify-content-center">
            <div class="card text-center" style="width: 18rem;">
            <img src="https://www.xandermar.com/assets/npxXWgQ33ZQ.jpg" class="card-img-top" alt="Web Design and Hosting">
            <div class="card-body">
                <h5 class="card-title">
                    <a class="btn btn-primary" href="/services/web-design-and-hosting">Web Design and Hosting
                    </a>
                </h5>
                <p class="card-text">Functional design and hosting with tools to help you reach an unlimited customer base.
                </p>
            </div>
            </div>
        </div>
        <div class="col-4 d-flex justify-content-center">
            <div class="card text-center" style="width: 18rem;">
            <img src="https://www.xandermar.com/assets/J0ZD8r_ClGg.jpg" class="card-img-top" alt="Easy Signage">
            <div class="card-body">
                <h5 class="card-title">
                    <a class="btn btn-primary" href="/services/easy-signage">Easy Signage
                    </a>
                </h5>
                <p class="card-text">Digital menu or informational signage for your restaurant, hotel or entertainment business.
                </p>
            </div>
            </div>
        </div>
    </div>
</div>
<div class="bg-dark-subtle full-screen">
    <div class="container-xxl">
        <div class="row">
            <div class="col">
                <div class="ratio ratio-16x9">
                <iframe src="https://www.youtube.com/embed/IPR36uraNwc" title="YouTube video" allowfullscreen=""></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-xxl">
    <div class="row">
        <div class="col-xl-10 offset-xl-1 col-md-12 col-12">
            <div class="bg-secondary py-6 px-6 px-xl-0 rounded-4 ">
               <div class="row align-items-center">
                  <div class="offset-xl-1 col-xl-5 col-md-6 col-12">
                     <div class="p-3">
                        <h2 class="h1 text-white mb-3">Continuous Integration</h2>
                        <p class="text-white fs-4">
                           Best fit your team's deployment using GitHub or GitLab repositories
                           in conjunction with Acquia, AWS or a custom datacenter.
                        </p>
                        <a href="https://www.xandermar.com/services/continuous-integration" class="btn btn-dark">Learn More</a>
                     </div>
                  </div>
                  <div class="col-xl-6 col-md-6 col-12">
                     <div class="text-center">
                        <img src="https://www.xandermar.com/xan-placeholder.jpg" width="350" alt="learning" class="rounded-4 img-fluid">
                     </div>
                  </div>
               </div>
            </div>
        </div>
    </div>
</div>
<div class="bg-dark-subtle full-screen-last">
    <div class="container-xxl">
        <div class="row text-center">
            <div class="col">
                <!-- heading -->
                <h2 class="display-4 ">YouTube Video Production Services</h2>
                <p class="lead  px-lg-12 mb-6">
                    Showcase your business products and services with professional video services
                    and editing so you can share with millions on YouTube. Show prospective
                    customers who you are and what your business is all about.
                </p>
                <!-- button -->
                <div class="d-grid d-md-block">
                    <a href="/services/youtube-video-production-services" class="btn btn-primary mb-2 mb-md-0">Learn More</a>
                </div>
            </div>
        </div>
    </div>
</div>

