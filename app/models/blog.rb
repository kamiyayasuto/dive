class Blog < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
