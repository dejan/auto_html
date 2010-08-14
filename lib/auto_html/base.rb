module AutoHtml
  def self.add_filter(name, &block)
    AutoHtml::Builder.add_filter(name, &block)
  end

  def auto_html(raw, &proc)
    return "" if raw.blank?
    builder = Builder.new(raw)
    builder.instance_eval(&proc)
  end
end
