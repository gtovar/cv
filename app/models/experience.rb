class Experience < ActiveRecord::Base
  has_many :proyects
  extend FriendlyId
  friendly_id :name, use: [:slugged,:history]
  def should_generate_new_friendly_id?
      name_changed?
  end
end
