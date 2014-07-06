class AddExperienceIdToProyects < ActiveRecord::Migration
  def change
    add_column :proyects, :experience_id, :integer
  end
end
