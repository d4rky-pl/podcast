if RUBY_PLATFORM =~ /64/
  FFMPEG.ffmpeg_binary = Rails.root.join('bin', 'ffmpeg64')
else
  FFMPEG.ffmpeg_binary = Rails.root.join('bin', 'ffmpeg32')
end
