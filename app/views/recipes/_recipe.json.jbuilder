json.extract! recipe, :id, :title, :recipe, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
