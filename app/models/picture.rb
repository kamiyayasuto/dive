class Picture < ActiveRecord::Base
  validates :image, :content,  presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user
end
