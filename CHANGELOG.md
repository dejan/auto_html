CHANGELOG
=========

## 2.0.0-snapshot

* New, breaking API
* Removed Rails dependency
* Filters cleanup, only the most popular ones are bundled

## 1.6.4

* New filter: youtube image filter 

## 1.6.3

* Fixed Twitter filter
* New filter: liveleak

## 1.6.2

* Deferred loading of filters dependencies when possible
* Wrap youtube video with div for easier styling
* Update redcarpet to latest
* New filter: instagram 
* Small fix for hashtag filter
* Allow replacing youtube URL without protocol
* Fix gist filter - add type attribute

## 1.6.1

* Permit auto_html_for on an attribute that is not in the DB.
* Image filter: :proxy option, do not format existing <img> 
* Link filter: :short_link_name option
* GoogleMap filter: support for all countries (domains)
* Gist filter: support for new URL scheme
* Soundcloud: does not use network call anymore
* GoogleMap: add :zoom, :show_info, :type and :more param
* YouTube: add :autoplay option
* New filters: worldstar
* Deprecate GoogleVideo since it is discontinued

## 1.6.0

* Twitter, Flickr, Soundcloud filters added
* Options for markdown filter added
* Omit protocol where applicable (youtube, googlemap, vimeo) to avoid mixed content warnings #50
* rake task fixed #42
* Relax redcarpet version requirement

## 1.5.3

* Fixed Mongoid support

## 1.5.2

* Works with Rails 3.2.1+ 
* Updated youtube regex to account for feature=player_embedded url param

## 1.5.1

* Rails 3.2 support 
* Gist & GoogleMap filter
* fix #26 - error after the rake task completed
* fix #29 - youtube filter swallows text that comes after a link

## 1.5.0

* use redcarpet ~> 2.0.0; :renderer option
* use rinku ~> 1.5.0
* Rake task for rebuilding cached markup
* default youtube embed code should be the same as provide by youtube.com; wmode is no longer default param
* reducing dependencies - do not bundle RedCloth filter. Redcarpet (markdown) is default choice for markup and planned for more usage internally, so the lib goes with only that.
* minor youtube filter fixes (https support, short url with params)

## 1.4.2

* Add support for YouTube short url
* added Redcarpet filter (Markdown rendering)

## 1.4.1

* AutoHtml gets module method: AutoHtml.auto_html(...)
* on blank filter list return input instead of nil
* AutoHtmlFor producing html_safe

## 1.4.0

* remove Rails dependencies by using rinku & tag_helper
* image filter supports attributes
* output of auto_html method is html_safe
* auto_html module is included in ApplicationHelper

## 1.3.7

* require activerecord only if available

## 1.3.6

* RedCloth name fix in gemspec

## 1.3.5

* RedCloth filter
* https support for image filter

## 1.3.4

* added metacafe filter
* converts all filter outputs to_s

## 1.3.3

* yet another Rails 3 initialization fix

## 1.3.2

* pre-rails 3 initialization fix

## 1.3.1

* Rails 3 initialization fix
* fixes to conform Rails 3.0.0.rc, sanitization by default in text_helpers (auto_link, simple_format)
* added vimeo html5 universal embed player 

## 1.3.0

* no need for explicit call to auto_html_prepare
* no need for DB column for cache (ie. _html)
* Rails 3 support
* correctly handle blank and nil values when applying auto_html
* more filters: youtube_js_api
* youtube filter supports html5


## 1.2.1

* more options for vimeo filter
* switch to gemcutter

## 1.2.0

* link filter now uses Rails' link discovery engine #3
* added dailymotion filter
* added sanitize filter

## 1.1.2

* link filter fix #2

## 1.1.1

* test_helper fix

## 1.1.0

* Plugin gemified
* AutoHtmlFor.options[:htmlized_attribute_suffix] is now AutoHtmlFor.auto_html_for_options[:htmlized_attribute_suffix]. Closes #1
* Removed deezer filter since deezer.com no longer provides sharing of this kind

## 1.0.0

* Initial public release

