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

AutoHtml is highly customizable, and you can easily create new filters that will transform user input any way you like. For instance, this is the image filter that comes bundled with plugin:

    AutoHtml.add_filter(:image) do |text|
      text.gsub(/http:\/\/.+\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
        %|<img src="#{match}" alt=""/>|
      end
    end


## Non-ActiveRecord models

AutoHtml uses standard ActiveModel API, which means that you can include AutoHtmlFor module (that automates transformation of the field) in any non-ActiveRecord model that uses ActiveModel. Here's working [mongoid](http://mongoid.org/) example:

    class Post
      include Mongoid::Document
      include AutoHtmlFor

      field :body

      auto_html_for :body do
        simple_format
        link
      end
    end


## Bundled filters

For filter list and options they support check: <http://github.com/dejan/auto_html/tree/master/lib/auto_html/filters>


## Install

Specify the gem in Gemfile of the project

    gem "auto_html"


## Credits

Author: [Dejan Simic](http://github.com/dejan)<br/>
Contributors: [Claudio Perez Gamayo](https://github.com/crossblaim), [Matt Polito](https://github.com/mattpolito), [Ryan Heneise](https://github.com/mysmallidea), [Caleb Wright](https://github.com/fabrikagency), [Derrick Camerino](https://github.com/robustdj), [Daniel Weinmann](https://github.com/danielweinmann), [Edgars Beigarts](https://github.com/ebeigarts), [Henning Thies](https://github.com/henningthies), [rbq](https://github.com/ebeigarts)
