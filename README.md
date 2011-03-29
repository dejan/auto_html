auto_html
=========

auto_html is a Rails extension for transforming URLs to appropriate resource (image, link, YouTube, Vimeo video,...). It's the perfect choice if you don't want to bother visitors with rich HTML editor or markup code, but you still want to allow them to embed video, images, links and more on your site, purely by pasting URL. Check out the [live demo](http://auto-html.rors.org).


## Example usage

Transforming string with text and URLs is done with *auto_html* method:

    include AutoHtml
    
    auto_html('Hey! Checkout out: http://vukajlija.com') { simple_format; link(:target => 'blank') }
    => "<p>Hey! Checkout out: <a href='http://vukajlija.com' target='blank'>http://vukajlija.com</a></p>"

You'll probably have user input stored in model, so it's a good place to automate and even store this conversion for performance reason. This is done with *auto_html_for* method. Let's say you have model Comment with attribute body. Create another column in table Comments called body_html (again, this is optional but recommended for performance reasons). Now have something like this: 

    class Comment < ActiveRecord::Base
      auto_html_for :body do
        html_escape
        image
        youtube(:width => 400, :height => 250)
        link :target => "_blank", :rel => "nofollow"
        simple_format
      end
    end

... and you'll have this behaviour: 

    Comment.create(:body => 'Hey check out this cool video: http://www.youtube.com/watch?v=WdsGihou8J4')  
    => #<Comment id: 123, body: '<p>Hey check out this cool video: <iframe class="youtube-player" type="text/html" width="587" height="350" src="http://www.youtube.com/embed/WdsGihou8J4" frameborder="0"> <br /></iframe></p>'>

Note that order of invoking filters is important, ie. you want html_escape as first and link amongst last, so that it doesn't transform youtube URL to plain link.


Now all you have to do is to display it in template without escaping, since plugin took care of that:

    <% for comment in @comments %>
       <li><%= comment.body_html %></li>
    <% end %>


If you need to display preview, no problem. Have something like this as action in your controller:

    def preview
      comment = Comment.new(params[:comment])
      render :text => comment.body_html
    end

Plugin is highly customizable, and you can easily create new filters that will transform user input any way you like. For instance, this is the image filter that comes bundled with plugin:

    AutoHtml.add_filter(:image) do |text|
      text.gsub(/http:\/\/.+\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
        %|<img src="#{match}" alt=""/>|
      end
    end



## Bundled filters

For filter list and options they support check: <http://github.com/dejan/auto_html/tree/master/lib/auto_html/filters>


## Install

### Important note on versions

As from version 1.2.0 auto_html uses Rails' engine for discovering links. There are some bugs with that engine in versions under Rails 2.3.2. so it's recommended you use auto_html 1.1.2 in that case, since internal engine is used in that version.

    for Rails <= 2.3.1 use auto_html 1.1.2<br/>
    for Rails >= 2.3.2 use the latest auto_html

### As a gem

To enable the library in your Rails 2.1-2.3 project, use the gem configuration method in "config/environment.rb"

    Rails::Initializer.run do |config|
      config.gem 'auto_html'
    end

In Rails 3.0 specify the gem in your Gemfile

    gem "auto_html"

### As a Rails plugin

    script/plugin install git://github.com/dejan/auto_html.git


## Credits

Author: [Dejan Simic](http://github.com/dejan)<br/>
Contributors: [Claudio Perez Gamayo](http://github.com/crossblaim), [Matt Polito](http://github.com/mattpolito), [Ryan Heneise](http://github.com/mysmallidea), [Caleb Wright](http://github.com/fabrikagency), [Derrick Camerino](https://github.com/robustdj), [Daniel Weinmann](https://github.com/danielweinmann)
