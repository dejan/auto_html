## 1.3.6, released 2011-30-03
* RedCloth name fix in gemspec

## 1.3.5, released 2011-30-03
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

