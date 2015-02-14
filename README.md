# AutoHtml

AutoHtml is a collection of filters that transform plain text into HTML code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'auto_html'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install auto_html
```

## Usage

Every filter accepts input through `call` method:

```ruby
AutoHtml::Link.call('Checkout out my blog: http://rors.org')
# => 'Checkout out my blog: <a href="http://rors.org">http://rors.org</a>'
```

This will instantiate the `Link` filter object with default options. If you want to specify 
differnet options, you can instantiate the filter object yourself like so:

```ruby
AutoHtml::Link.new(target: '_blank').call('Checkout out my blog: http://rors.org')
# => 'Checkout out my blog: <a href="http://rors.org" target="blank">http://rors.org</a>'
```

To combine multiple filters instantiate a special filter called `Format` that accepts array of filters:

```ruby
format = Format.new [HtmlEscape, Image, Link, SimpleFormat]
format.call('Check the logo: http://rors.org/images/rails.png. Visit: http://rubyonrails.org')
# => '<p>Check the logo: <img src="http://rors.org/images/rails.png" alt="" />. Visit: <a href="http://rubyonrails.org" >http://rubyonrails.org</a></p>'
```

`Format` can accept both `Filter` instance or class, for example:

```ruby
Format.new [
  HtmlEscape,
  Youtube.new(width: 410, height: 270),
  Vimeo.new(width: 410, height: 270),
  Image,
  GoogleMaps,
  Link.new(target: "_blank", rel: "nofollow"),
  Emoji,
  SimpleFormat
]
```

Note that order of filters is important, i.e. you usually want `HtmlEscape` as first and `Link` amongst last, so that it doesn't transform YouTube URLs to plain links.

## Bundled filters

* `AutoHtml::Emoji`
* `AutoHtml::Gist`
* `AutoHtml::GoogleMaps`
* `AutoHtml::HtmlEscape`
* `AutoHtml::Image`
* `AutoHtml::Instagram`
* `AutoHtml::Link`
* `AutoHtml::SimpleFormat`
* `AutoHtml::Vimeo`
* `AutoHtml::Youtube`

## Creating a new filter

Here's an example of the filter that would convert Ted links to embeded videos

```Ruby
module AutoHtml
  class Ted < Filter
    def call(input)
      input.gsub(/https?:\/\/(www.|embed.)?ted\.com\/talks\/([A-Za-z0-9._%-]*)\.html((\?|#)\S+)?/) do
        ted_page = $2
        tag(:iframe
          framebroder: 0,
          scrolling: 'no',
          width: width,
          height: height,
          src: "http://embed.ted.com/talks/#{ted_page}.html",
          webkitAllowFullScreen: true,
          mozallowfullscreen: true,
          allowFullScreen: true)
    end

    private

    def width
      @options[:width] || 560
    end

    def height
      @options[:height] || 315
    end
  end
end
```

## Rails integration

In `initializer/auto_html.rb` have something like:

```ruby
module AutoHtml
  CommentFormat =
    Format.new [
      HtmlEscape,
      Youtube.new(width: 410, height: 270),
      Vimeo.new(width: 410, height: 270),
      Image,
      GoogleMaps,
      Link.new(target: "_blank", rel: "nofollow"),
      Emoji,
      SimpleFormat
    ]

  ChatLineFormat =
    Format.new [
      HtmlEscape,
      Emoji,
      SimpleFormat
    ]

  # ... define more formats if needed
end
```

Now, to store transformation in database (for performance reasons) in a separate column:

```ruby
class Comment < ActiveRecord::Base
  def text=(str)
    self[:text_html] = AutoHtml::CommentFormat.call(str)
    super
  end
end
```

To transform on-the-fly (consider caching the fragment):

```ruby
class ChatLineHelper
  def format(comment)
    AutoHtml::ChatLineFormat.call(chat_line.text)
  end
end
```

## Code status

[![Circle CI](https://circleci.com/gh/dejan/auto_html/tree/banzai.svg?style=svg&circle-token=57823c8b62302106564f97b58b64643b9760ed99)](https://circleci.com/gh/dejan/auto_html/tree/banzai)

## Licence

AutoHtml is released under the [MIT License](https://raw.githubusercontent.com/dejan/auto_html/master/MIT-LICENCE).
