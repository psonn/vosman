class AddPublishedToPins < ActiveRecord::Migration
  def change
    add_column :pins, :published, :boolean
  end
end
