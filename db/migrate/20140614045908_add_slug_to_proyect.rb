class AddSlugToProyect < ActiveRecord::Migration
  def change
    add_column :proyects, :slug, :string
    add_index :proyects, :slug, unique: true
  end
end
