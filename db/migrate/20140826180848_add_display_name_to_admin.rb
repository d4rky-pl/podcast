class AddDisplayNameToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :display_name, :string
  end
end
