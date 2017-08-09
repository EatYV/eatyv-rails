class Recipe < ApplicationRecord
  belongs_to :user
  
  geocoded_by :full_address
  after_validation :geocode
  
  mount_uploader :image, ImageUploader
    
  def full_address
      [city, address, zipcode].join(', ')
  end
end
