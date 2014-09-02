class HomeController < ApplicationController
  def index
    @podcasts = Podcast.available.order('created_at desc').page(params[:page])
    respond_to do |format|
      format.html
      format.rss do
        first_podcast = @podcasts.first
        if first_podcast.present?
          pub_date = first_podcast.published_at.to_s(:rfc822)
          last_build_date = first_podcast.published_at.to_s(:rfc822)
        else
          pub_date = last_build_date = Time.now.to_s(:rfc822)
        end
        render locals: { pub_date: pub_date, last_build_date: last_build_date, podcasts: @podcasts }, content_type: 'text/xml'
      end
    end
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
