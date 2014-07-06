class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end