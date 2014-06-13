class Proyect < ActiveRecord::Base
  mount_uploader :cover, CoverUploader
  mount_uploader :logo, LogoUploader
end
