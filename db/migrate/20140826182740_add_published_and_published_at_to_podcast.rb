class AddPublishedAndPublishedAtToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :published, :boolean
    add_column :podcasts, :published_at, :timestamp
  end
end
