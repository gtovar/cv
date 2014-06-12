class Proyect < ActiveRecord::Base
  mount_uploader :cover, CoverUploader
end
