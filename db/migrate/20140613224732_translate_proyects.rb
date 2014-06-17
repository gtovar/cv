class TranslateProyects < ActiveRecord::Migration
  def self.up
    Proyect.create_translation_table!({
      :position => :string,
      :activities => :text,
      :outstaning => :text,
      :description => :text,
      :activity_description => :text,
      :category => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Proyect.drop_translation_table! :migrate_data => true
  end
end
