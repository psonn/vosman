class CreateContactpaginas < ActiveRecord::Migration
  def change
    create_table :contactpaginas do |t|

      t.timestamps
    end
  end
end
