class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  mount_uploader :photo, ProductPhotoUploader
end
