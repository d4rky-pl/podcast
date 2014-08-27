# encoding: utf-8

class PodcastStreamUploader < CarrierWave::Uploader::Base
  storage :file

  include CarrierWave::Video
#  include ::CarrierWave::Backgrounder::Delay

  version :mp3 do
    process :encode_video => [ :mp3, { audio_codec: 'libmp3lame', custom: '-qscale:a 2' } ]
    def full_filename(for_file = model.logo.file)
      title.parameterize + ".mp3"
    end
  end

  version :ogg do
    process :encode_video => [ :ogg, { audio_codec: 'libvorbis', custom: '-qscale:a 7' } ]
    def full_filename(for_file = model.logo.file)
      title.parameterize + ".ogg"
    end
  end

  version :m4a do
    process :encode_video => [ :m4a, { audio_codec: 'libfaac', custom: '-b:a 192k' } ]
    def full_filename(for_file = model.logo.file)
      title.parameterize + ".m4a"
    end
  end

  def store_dir
    "../private/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(mp3 ogg aac m4a)
  end

end
