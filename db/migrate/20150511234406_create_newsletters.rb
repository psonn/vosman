class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
    	t.references :pins, index: true
    	t.references :subscriber
    	t.timestamps
    end
  end
end
