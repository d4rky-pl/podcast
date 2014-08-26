class Podcast < ActiveRecord::Base
  belongs_to :admin
  mount_uploader :stream, PodcastStreamUploader
  attr_accessor :stream_cache
end
