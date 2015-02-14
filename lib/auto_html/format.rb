require 'banzai'

module AutoHtml
  # Collection of filters
  class Format < Banzai::Pipeline
    def call(text)
      if text.nil? || text.empty?
        ''
      else
        super
      end
    end
  end
end
