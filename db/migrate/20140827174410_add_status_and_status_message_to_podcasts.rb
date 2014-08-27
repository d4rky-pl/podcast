class AddStatusAndStatusMessageToPodcasts < ActiveRecord::Migration
  def change
    add_column :podcasts, :status, :integer, default: 0
    add_column :podcasts, :status_message, :string
  end
end
