class Recipe < ApplicationRecord
  belongs_to :user
  
  geocoded_by :full_address
  after_validation :geocode
    
  def full_address
      [city, address, zipcode].join(', ')
  end
end
