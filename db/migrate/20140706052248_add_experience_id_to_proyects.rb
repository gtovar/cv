class AddExperienceIdToProyects < ActiveRecord::Migration[5.0]
  def change
    add_column :proyects, :experience_id, :integer
  end
end
