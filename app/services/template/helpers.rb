module Template::Helpers
  def blog_title
    @data.config.blog_title
  end

  def stylesheet_tag
    rails_helpers.stylesheet_link_tag 'application', media: 'all'
  end

  def javascript_tag
    rails_helpers.javascript_include_tag 'application'
  end

  def feed_tag
    rails_helpers.auto_discovery_link_tag :rss, feed_url, {title: 'Subskrybuj tę witrynę poprzez RSS 2.0'}
  end

  def feed_url
    Rails.application.routes.url_helpers.feed_path
  end

  def page
    { self.class.name.split('::').last.downcase => true }
  end

  def podcast_path(podcast)
    url_helpers.podcast_path(podcast)
  end

  def stream_path(model, format='ogg')
    url_helpers.stream_path(model, { format: format })
  end

  def download_path(model, format='ogg')
    url_helpers.download_path(model, { format: format })
  end

  protected
  def rails_helpers
    ApplicationController.helpers
  end

  def url_helpers
    Rails.application.routes.url_helpers
  end
end
