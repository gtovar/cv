class Proyect < ActiveRecord::Base
  translates :position, :activities, :outstaning, :description
  mount_uploader :cover, CoverUploader
  mount_uploader :logo, LogoUploader
end
