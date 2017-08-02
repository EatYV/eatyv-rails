class AddUserLocationToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :city, :string
    add_column :recipes, :address, :string
    add_column :recipes, :zipcode, :string
    add_column :recipes, :latitude, :float
    add_column :recipes, :longitude, :float
  end
end
