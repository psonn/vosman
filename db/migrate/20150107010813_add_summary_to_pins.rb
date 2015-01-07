class AddSummaryToPins < ActiveRecord::Migration
  def change
    add_column :pins, :summary, :text
  end
end
