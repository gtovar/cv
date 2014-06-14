class Proyect < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged,:history]

  translates :position, :activities, :outstaning, :description
  mount_uploader :cover, CoverUploader
  mount_uploader :logo, LogoUploader
  def should_generate_new_friendly_id?
      name_changed?
  end
end
