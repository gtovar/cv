class AddLinkToProyects < ActiveRecord::Migration[5.0]
  def change
    add_column :proyects, :link, :string
    add_column :proyects, :logo, :string
  end
end
