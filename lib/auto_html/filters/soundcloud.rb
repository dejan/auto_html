require 'uri'
require 'net/http'

AutoHtml.add_filter(:soundcloud).with({}) do |text, options|
  # set these options
  # :maxwidth => '', :maxheight => '', :auto_play => false, :show_comments => false
  text.gsub(/(https?:\/\/)?(www.)?soundcloud\.com\/.*/) do |match|
    new_uri = match.to_s
    new_uri = (new_uri =~ /^https?\:\/\/.*/) ? URI(new_uri) : URI("http://#{new_uri}")
    new_uri.normalize!

    uri = URI("http://soundcloud.com/oembed")
    params = {:format => 'json', :url => new_uri}.merge(options)
    uri.query = params.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.join('&')
    response = Net::HTTP.get(uri)
    if !response.blank?
      JSON.parse(response)["html"]
    else
      match
    end
  end
end

