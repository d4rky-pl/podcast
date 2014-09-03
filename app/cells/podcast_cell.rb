class PodcastCell < Cell::ViewModel
  include ActionView::Helpers::DateHelper

  property :id
  property :title

  helper_method :id, :title, :description, :podcast_path, :stream_path, :download_path, :available_formats

  def index
    render
  end

  def show
    render
  end

  def description
    @description ||= GitHub::Markup.render('.md', model.description.to_s).html_safe
  end

  def published_at
    if model.published_at < (Time.now + 2.days)
      I18n.t 'podcast.published_at', time: l(model.published_at, format: "%e %B %Y")
    else
      I18n.t 'podcast.relative_published_at', time: time_ago_in_words(model.published_at)
    end
  end

  def podcast_path
    Rails.application.routes.url_helpers.podcast_path(model)
  end

  def stream_path(format='ogg')
    Rails.application.routes.url_helpers.stream_path(model, { format: format })
  end

  def download_path(format='ogg')
    Rails.application.routes.url_helpers.download_path(model, { format: format })
  end

  def available_formats
    [
        [:ogg, 'audio/ogg'],
        [:mp3, 'audio/mpeg'],
        [:m4a, 'audio/mp4']
    ]
  end
end
