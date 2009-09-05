# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{auto_html}
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dejan Simic"]
  s.date = %q{2009-09-05}
  s.description = %q{Automatically transforms urls (via domain) and includes the destination resource (Vimeo, YouTube movie, image, ...) in your document}
  s.email = %q{desimic@gmail.com}
  s.files = ["CHANGELOG.rdoc", "README.rdoc", "VERSION.yml", "lib/auto_html", "lib/auto_html/auto_html_for.rb", "lib/auto_html/base.rb", "lib/auto_html/builder.rb", "lib/auto_html/filter.rb", "lib/auto_html/filters", "lib/auto_html/filters/google_video.rb", "lib/auto_html/filters/html_escape.rb", "lib/auto_html/filters/image.rb", "lib/auto_html/filters/link.rb", "lib/auto_html/filters/simple_format.rb", "lib/auto_html/filters/vimeo.rb", "lib/auto_html/filters/youtube.rb", "lib/auto_html.rb", "test/fixture_setup.rb", "test/fixtures", "test/fixtures/database.yml", "test/fixtures/schema.rb", "test/functional", "test/functional/auto_html_for_options_test.rb", "test/functional/auto_html_for_test.rb", "test/functional/test.sqlite3", "test/test_helper.rb", "test/unit", "test/unit/auto_html_test.rb", "test/unit/filters", "test/unit/filters/google_video_test.rb", "test/unit/filters/html_escape_test.rb", "test/unit/filters/image_test.rb", "test/unit/filters/link_test.rb", "test/unit/filters/simple_format_test.rb", "test/unit/filters/vimeo_test.rb", "test/unit/filters/youtube_test.rb", "test/unit/unit_test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/dejan/auto_html}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Automatically transforms urls (via domain) and includes the destination resource (Vimeo, YouTube movie, image, ...) in your document}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
