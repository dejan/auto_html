## 1.6.0, released 2012-07-28 
* Twitter, Flickr, Soundcloud filters added
* Options for markdown filter added
* Omit protocol where applicable (youtube, googlemap, vimeo) to avoid mixed content warnings. Fixes [#50](https://github.com/dejan/auto_html/issues/50)
* rake task fixed. Resolves [#42](https://github.com/dejan/auto_html/issues/42)
* Relax redcarpet version requirement

## 1.5.3, released 2012-05-08
* Fixed Mongoid support

## 1.5.2, released 2012-05-05
* Works with Rails 3.2.1+ 
* Updated youtube regex to account for feature=player_embedded url param

## 1.5.1, released 2012-02-18
* Rails 3.2 support 
* Gist & GoogleMap filter
* fix #26 - error after the rake task completed
* fix #29 - youtube filter swallows text that comes after a link

## 1.5.0, released 2011-12-07
* use redcarpet ~> 2.0.0; :renderer option
* use rinku ~> 1.5.0
* Rake task for rebuilding cached markup
* default youtube embed code should be the same as provide by youtube.com; wmode is no longer default param
* reducing dependencies - do not bundle RedCloth filter. Redcarpet (markdown) is default choice for markup and planned for more usage internally, so the lib goes with only that.
* minor youtube filter fixes (https support, short url with params)

## 1.4.2, released 2011-08-12
* Add support for YouTube short url
* added Redcarpet filter (Markdown rendering)

## 1.4.1, released 2011-07-09
* AutoHtml gets module method: AutoHtml.auto_html(...)
* on blank filter list return input instead of nil
* AutoHtmlFor producing html_safe

## 1.4.0, released 2011-07-09
* remove Rails dependencies by using rinku & tag_helper
* image filter supports attributes
* output of auto_html method is html_safe
* auto_html module is included in ApplicationHelper

## 1.3.7, released 2011-04-12
* require activerecord only if available

## 1.3.6, released 2011-03-30
* RedCloth name fix in gemspec

## 1.3.5, released 2011-03-30
* RedCloth filter
* https support for image filter

## 1.3.4, released 2011-01-01
* added metacafe filter
* converts all filter outputs to_s

## 1.3.3, released 2010-09-01
* yet another Rails 3 initialization fix

## 1.3.2, released 2010-08-27
* pre-rails 3 initialization fix

## 1.3.1, released 2010-08-22
* Rails 3 initialization fix
* fixes to conform Rails 3.0.0.rc, sanitization by default in text_helpers (auto_link, simple_format)
* added vimeo html5 universal embed player 

## 1.3.0, released 2010-08-14
* no need for explicit call to auto_html_prepare
* no need for DB column for cache (ie. _html)
* Rails 3 support
* correctly handle blank and nil values when applying auto_html
* more filters: youtube_js_api
* youtube filter supports html5


## 1.2.1, released 2009-10-28

* more options for vimeo filter
* switch to gemcutter

## 1.2.0, released 2009-09-26

* link filter now uses Rails' link discovery engine. Closes: <http://github.com/dejan/auto_html/issues#issue/2> and  <http://github.com/dejan/auto_html/issues#issue/3> if Rails 2.3+ is in use.
* added dailymotion filter
* added sanitize filter

## 1.1.2, released 2009-09-24

* link filter fix. Closes: <http://github.com/dejan/auto_html/issues#issue/2>

## 1.1.1, released 2009-09-06

* test_helper fix

## 1.1.0, released 2009-09-05

* Plugin gemified
* AutoHtmlFor.options[:htmlized_attribute_suffix] is now AutoHtmlFor.auto_html_for_options[:htmlized_attribute_suffix]. Closes gh-1
* Removed deezer filter since deezer.com no longer provides sharing of this kind

## 1.0.0

* Stuff described here: <http://www.elctech.com/projects/auto_html-plugin>

