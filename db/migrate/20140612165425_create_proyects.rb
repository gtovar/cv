class CreateProyects < ActiveRecord::Migration
  def change
    create_table :proyects do |t|
      t.string :name
      t.date :start_time
      t.date :end_time
      t.string :position
      t.string :activities
      t.text :outstaning
      t.string :tools
      t.text :description
      t.string :cover
      t.text :activity_description

      t.timestamps
    end
  end
end
