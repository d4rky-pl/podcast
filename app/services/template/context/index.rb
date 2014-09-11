class Template::Context::Index < Template::Context

  def podcasts
    @data.podcasts.map do |podcast|
      {
          url: podcast_path(podcast),
          title: podcast.title
      }
    end
  end
end