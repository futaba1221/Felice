class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :nices, dependent: :destroy
  belongs_to :user
  mount_uploaders :images, ImageUploader
   serialize :images, JSON
   
end
