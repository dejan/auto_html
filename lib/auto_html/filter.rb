require 'banzai'
require 'tag_helper'

module AutoHtml
  # Main building block for transforming text input
  class Filter < Banzai::Filter
    include TagHelper
  end
end
