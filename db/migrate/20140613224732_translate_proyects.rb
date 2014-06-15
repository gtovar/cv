class TranslateProyects < ActiveRecord::Migration
  def self.up
    Proyect.create_translation_table!({
      :position => :string,
      :activities => :string,
      :outstaning => :text,
      :description => :text,
      :activity_description => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Proyect.drop_translation_table! :migrate_data => true
  end
end
