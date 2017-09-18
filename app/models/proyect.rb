class Proyect < ActiveRecord::Base
  belongs_to :experience
  extend FriendlyId
  friendly_id :name, use: [:slugged,:history]

  translates :position, :activities, :outstaning, :description, :activity_description, :category, :tools
  mount_uploader :cover, CoverUploader
  mount_uploader :logo, LogoUploader
  #validates :name,:start_time,:end_time,:position,:activities,:outstaning,:tools,:description,:cover,:activity_description,:category, presence: true
  def should_generate_new_friendly_id?
      name_changed?
  end

  def self.proyects_experience
      joins(:experience,:translations).select("proyects.id, proyects.experience_id, proyects.cover, proyects.slug AS proyect_slug, proyects.name, proyects.category, experiences.slug AS experience_slug" )
  end
end
