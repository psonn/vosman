class AddTitleToContactpaginas < ActiveRecord::Migration
  def change
    add_column :contactpaginas, :title, :string
    add_column :contactpaginas, :body, :text
  end
end
