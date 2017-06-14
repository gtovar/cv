class AddActualToExperience < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :actual, :boolean, defualt: false
  end
end
