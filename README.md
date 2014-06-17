cv
==

#### Format list for Activities

```
  <ul class="fa-ul">
    <li><i class="fa fa-li fa-skype"></i><strong>Skype</strong> : user_skype</li>
    <li><i class="fa fa-li fa-envelope-o"></i><strong>Email</strong> : example@gmail.com</li>
    <li><i class="fa fa-li fa-globe"></i><strong><%= t :website %></strong> : www.example.com</li>
  </ul>
```

[Visit Github for markdown](https://help.github.com/articles/markdown-basics)

#### Web type proyects

```
  <div id="portfolio-wrap" tabindex="1">
    <div id="portfolio-page">
      <div id="portfolio-content">
          <div class="container">
          <div class="row">
          <div id="protfolio-control">
            <div class="row">
              <div class="col-md-4 col-sm-4 col-xs-4">
                <a href="#" id="prev-project" title="Previous Project"><i class="fa fa-arrow-left"></i></a>
              </div>
              <div class="col-md-4 col-sm-4 col-xs-4 text-center">
                <a href="#" id="close-project" title="Close Project"><i class="fa fa-times"></i></a>
              </div>
              <div class="col-md-4 col-sm-4 col-xs-4 text-right">
                <a href="#" id="next-project" title="Next Project"><i class="fa fa-arrow-right"></i></a>
              </div>
            </div>
          </div>
          <!-- End #protfolio-control -->
          <!-- Ajax will load into here -->
          <div id="portfolio-ajax">
          </div>
          <!-- End #portfolio-ajax -->
          <!-- End Ajax -->
        </div>
        </div>  
      </div>
      <!-- End #portfolio-content -->
    </div>
    <!-- End #portfolio-page -->
  </div>
```


#### Images for tools

```
    <div class="row new-line item_fade_in">
      <h4 class="white"><%= @proyect.tools %></h4>
      <div class="carrousel-container">
        <div id="left_scroll"><a href=""></a></div>
        <div id="carousel_inner">
          <ul class="clearfix" id="carousel_ul">
            <li><span><%= image_tag "clients/twitter.png",alt: "Twitter" %></span></li>
            <li><span><%= image_tag "clients/magento.png",alt: "magento" %></span></li>
            <li><span><%= image_tag "clients/mailchimp.png", alt: "mailchimp" %></span></li>
            <li><span><%= image_tag "clients/nexternal.png", alt: "nexternal" %></span></li>
            <li><span><%= image_tag "clients/wordpress.png", alt: "wordpress" %></span></li>
            <li><span><%= image_tag "clients/google.png", alt: "google" %></span></li>
          </ul>
        </div>
        <div id="right_scroll"><a href=""></a></div>
        <input type="hidden" id="hidden_auto_slide_seconds" value=0 />
      </div>
    </div>
```
