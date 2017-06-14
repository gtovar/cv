class AddActualToProyect < ActiveRecord::Migration[5.1]
  def change
    add_column :proyects, :actual, :boolean, default: false
  end
end
