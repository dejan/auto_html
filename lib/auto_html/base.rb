module AutoHtml
  def self.add_filter(name, &block)
    AutoHtml::Builder.add_filter(name, &block)
  end

  def auto_html(raw, &proc)
    return "" if raw.blank?
    builder = Builder.new(raw)
    result = builder.instance_eval(&proc)
    result.respond_to?(:html_safe) ?
      result.html_safe :
        result
  end
end
