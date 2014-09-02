class Podcast < ActiveRecord::Base
  belongs_to :admin
  mount_uploader :stream, PodcastStreamUploader
  process_in_background :stream, UploadWorker

  attr_accessor :stream_cache
  before_save :update_published_at

  enum status: [ :processing, :success, :broken ]

  scope :available, -> { where('status = ? and published = ?', 1, true) }

  def before_upload(message=nil)
    update! status: 0
  end

  def after_upload_success(message=nil)
    success!
  end

  def after_upload_failure(message=nil)
    broken!
    update! status_message: message
  end

  def description_md
    GitHub::Markup.render('.md', self.description.to_s).html_safe
  end

  def update_published_at
    self.published_at = Time.now if published && published_changed?
  end

  def to_param
    "#{id}-#{title.parameterize('_')}"
  end
end
