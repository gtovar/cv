class CreateProyects < ActiveRecord::Migration
  def change
    create_table :proyects do |t|
      t.string :name
      t.date :start_time
      t.date :end_time
      t.string :position
      t.string :activities
      t.string :outstaning
      t.string :tools
      t.string :description
      t.string :cover

      t.timestamps
    end
  end
end
