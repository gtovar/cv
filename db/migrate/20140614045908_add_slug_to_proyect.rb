class AddSlugToProyect < ActiveRecord::Migration[5.0]
  def change
    add_column :proyects, :slug, :string
    add_index :proyects, :slug, unique: true
  end
end
