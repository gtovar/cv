class TranslateProyects < ActiveRecord::Migration
  def self.up
    Proyect.create_translation_table!({
      :position => :string,
      :activities => :string,
      :outstaning => :string,
      :description => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Proyect.drop_translation_table! :migrate_data => true
  end
end
