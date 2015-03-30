AutoHtml.add_filter(:youtube).with(:width => 420, :height => 315, :frameborder => 0, :wmode => nil, :user_params => false, :autoplay => false, :hide_related => false) do |text, options|
  regex = /(https?:\/\/)?(www.)?(youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?feature=player_embedded&v=)([A-Za-z0-9_-]*)([\?\&]\S+)?/

  start_time = ->(params) {
    if params['start']
      params['start'].gsub(/\D/,'')
    elsif params['t']
      # convert timecode to seconds
      seconds = params['t'].scan(/(\d+)(.)/).map do |time, unit|
        case unit
        when 'h'
          time.to_i * 3600
        when 'm'
          time.to_i * 60
        else
          time.to_i
        end
      end
      seconds.sum
    end
  }

  text.gsub(regex) do
    youtube_id = $4
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
		wmode = options[:wmode]
    autoplay = options[:autoplay]
    hide_related = options[:hide_related]
		src = "//www.youtube.com/embed/#{youtube_id}"
    params = []
		params << "wmode=#{wmode}" if wmode
    params << "autoplay=1" if autoplay
    params << "rel=0" if hide_related

    if options[:user_params] && $5
      user_params = Hash[$5.split(/[\?\&]/).reject(&:blank?).map{|s| s.split('=')}]
      start_time_param = start_time.call(user_params)
      end_time_param = user_params['end']
      params << "start=#{start_time_param}" if start_time_param
      params << "end=#{end_time_param.gsub(/\D/,'')}" if end_time_param
    end

    src += "?#{params.join '&'}" unless params.empty?
    %{<div class="video youtube"><iframe width="#{width}" height="#{height}" src="#{src}" frameborder="#{frameborder}" allowfullscreen></iframe></div>}
  end
end
