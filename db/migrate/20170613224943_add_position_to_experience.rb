class AddPositionToExperience < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :position, :string
  end
end
