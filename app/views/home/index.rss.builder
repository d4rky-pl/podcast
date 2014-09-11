xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", 'xmlns:itunes' => "http://www.itunes.com/dtds/podcast-1.0.dtd", 'xmlns:content' => "http://purl.org/rss/1.0/modules/content/" do
  xml.channel do
    xml.title "Nerdblog.pl Podcast"
    xml.link href: root_url
    xml.description 'Eksperyment z formą, podcast poruszający praktycznie każdy temat, jaki przyjdzie mi do głowy.'
    xml.language 'pl-pl'
    xml.pubDate pub_date
    xml.lastBuildDate last_build_date

    for podcast in podcasts
      xml.item do
        xml.title podcast.title
        xml.link podcast_url(podcast)
        xml.guid podcast_url(podcast)
        xml.description podcast.description
        xml.pubDate podcast.published_at.to_s(:rfc822)
        xml.author "#{podcast.admin.email} (#{podcast.admin.display_name})"

        xml.content :encoded do
          xml.cdata! GitHub::Markup.render('.md', podcast.description.to_s)
        end

        xml.enclosure url: stream_url(podcast, {format: :m4a}), type: 'audio/x-m4a', length: podcast.stream.m4a.length

        xml.itunes :author, "Nerdblog.pl Podcast"
        xml.itunes :subtitle, truncate(podcast.description, length: 255)
        xml.itunes :summary, podcast.description
        xml.itunes :explicit, :yes
      end
    end
  end
end
