class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :comments

  mount_uploader :photo, ProductPhotoUploader
end
