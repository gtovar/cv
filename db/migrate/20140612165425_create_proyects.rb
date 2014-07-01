class CreateProyects < ActiveRecord::Migration
  def change
    create_table :proyects do |t|
      t.string :name
      t.date :start_time
      t.date :end_time
      t.string :position
      t.text :activities
      t.text :outstaning
      t.text :tools
      t.text :description
      t.string :cover
      t.text :activity_description
      t.string :category

      t.timestamps
    end
  end
end
