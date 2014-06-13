class Proyect < ActiveRecord::Base
  include FriendlyId
  friendly_id :name,use: [:slugged, :history]
  mount_uploader :cover, CoverUploader
  def should_generate_new_friendly_id?
      name_changed?
  end
end
