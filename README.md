auto_html [![Build Status](https://secure.travis-ci.org/dejan/auto_html.png?branch=master)](http://travis-ci.org/dejan/auto_html)
=========


auto_html is a Rails extension for transforming URLs to appropriate resource (image, link, YouTube, Vimeo video,...). It's the perfect choice if you don't want to bother visitors with rich HTML editor or markup code, but you still want to allow them to embed video, images, links and more on your site, purely by pasting URL. Check out the [live demo](http://rors.org/demos/auto_html).


## Install

Specify the gem in Gemfile of the project

    gem "auto_html"


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
        youtube(:width => 400, :height => 250, :autoplay => true)
        link :target => "_blank", :rel => "nofollow"
        simple_format
      end
    end

... and you'll have this behavior: 

    Comment.create(:body => 'Hey check out this cool video: http://www.youtube.com/watch?v=WdsGihou8J4')  
    => #<Comment id: 123, body: '<p>Hey check out this cool video: <div class="video youtube"><iframe class="youtube-player" type="text/html" width="587" height="350" src="http://www.youtube.com/embed/WdsGihou8J4" frameborder="0"> <br /></iframe></div></p>'>

Note that order of invoking filters is important, i.e. you want html_escape as first and link amongst last, so that it doesn't transform youtube URL to plain link.


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


## Bundled filters

For filter list and options they support check: <http://github.com/dejan/auto_html/tree/master/lib/auto_html/filters>


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


## Rake and Capistrano tasks

AutoHtml has a Rake task for rebuilding cached in DB column values
Usage: `rake auto_html:rebuild CLASS=[your model]`
Where `[your model]` is the name of model which values you want to rebuild.

If you want to run it on remote server, just add this to your `deploy.rb`:

    require 'auto_html/capistrano'
    
Now you can run `cap auto_html:rebuild CLASS=[your_model]`.


## Licence

Copyright (c) 2009 Dejan Simic

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
