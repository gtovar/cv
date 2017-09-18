class AddToolsToTranslateProyects < ActiveRecord::Migration[5.1]
  def change
    add_column :proyect_translations, :tools, :text
  end
end
