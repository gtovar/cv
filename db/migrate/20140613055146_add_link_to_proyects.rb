class AddLinkToProyects < ActiveRecord::Migration
  def change
    add_column :proyects, :link, :string
    add_column :proyects, :logo, :string
  end
end
