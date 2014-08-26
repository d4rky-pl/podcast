class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :description
      t.string :stream
      t.references :admin, index: true

      t.timestamps
    end
  end
end
