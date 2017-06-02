class TranslateExperiences < ActiveRecord::Migration[5.0]

  def self.up
    Experience.create_translation_table!({
      :description => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Experience.drop_translation_table! :migrate_data => true
  end
end
