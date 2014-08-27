class PodcastCell < Cell::ViewModel
  property :id
  property :title

  helper_method :id, :title, :description, :stream_url, :download_url

  def index
    render
  end

  def show
    render
  end

  def description
    @description ||= GitHub::Markup.render('.md', model.description).html_safe
  end

  def stream_url(format='ogg')
    Rails.application.routes.url_helpers.stream_url(model, { format: format })
  end

  def download_url(format='ogg')
    Rails.application.routes.url_helpers.download_url(model, { format: format })
  end

end
