class HomeController < ApplicationController
  def index
  end

  def podcast
    podcast = Podcast.find(params[:id])
  end

  def stream
    podcast = Podcast.find(params[:id])

    format = params[:format] || 'ogg'
    stream = podcast.stream.send(format)

    response.headers['X-Accel-Redirect'] = stream.url
    render nothing: true
  end
end
