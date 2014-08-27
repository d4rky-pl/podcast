class HomeController < ApplicationController
  def index
    @podcasts = Podcast.available.page(params[:page])
  end

  def podcast
    @podcast = Podcast.available.find(params[:id])
  end

  def stream
    podcast = Podcast.find(params[:id])

    format = params[:format] || 'ogg'
    stream = podcast.stream.send(format)

    response.headers['X-Accel-Redirect'] = stream.path.sub(Rails.root.to_s, '')
    render nothing: true
  end

  def download
    podcast = Podcast.find(params[:id])

    format = params[:format] || 'ogg'
    stream = podcast.stream.send(format)

    send_file stream.path
  end
end
