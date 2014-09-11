class Template::Context::Show < Template::Context

  def blog_title
    "#{@data.podcast.title} - #{super}"
  end

  def title
    @data.podcast.title
  end

  def description
    with_markup @data.podcast.description
  end

  def published_at
    if @data.podcast.published_at.nil?
      I18n.t 'podcast.not_published'
    elsif @data.podcast.published_at < (Time.now + 2.days)
      I18n.t 'podcast.published_at', time: I18n.l(@data.podcast.published_at, format: "%e %B %Y")
    else
      I18n.t 'podcast.relative_published_at', time: time_ago_in_words(@data.podcast.published_at)
    end
  end

  def sources
    formats.map do |format, mime_type|
      {
          src:  stream_path(format),
          type: mime_type
      }
    end
  end

  def downloads
    formats.map do |format, mime_type|
      {
          url: download_path(@data.podcast, format),
          format: format
      }
    end
  end

  def audio_tag
    content_tag :audio, controls: true do
      formats.each do |format, content_type|
        content_tag :source, src: stream_path(@data.podcast, format), type: content_type
      end
    end
  end

  protected
  def formats
    @formats ||= @data.config.available_formats.map do |format|
      [ format.to_sym, Rack::Mime::MIME_TYPES[".#{format.to_s}"] ]
    end
  end
end