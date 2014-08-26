# encoding: utf-8

class PodcastStreamUploader < CarrierWave::Uploader::Base
  storage :file

  include CarrierWave::Video
  include ::CarrierWave::Backgrounder::Delay

  version :mp3 do
    process :mp3, {}
  end

  version :ogg do
    process :ogg, {}
  end

  version :m4a do
    process :m4a, {}
  end

  version :webm do
    process :webm, {}
  end
  
  def store_dir
    "../private/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(mp3 ogg aac)
  end

  def filename
    model.title.parametrize
  end
end
