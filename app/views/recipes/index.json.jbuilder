json.array! @recipes do |recipe|
  json.lat recipe.latitude
  json.lng recipe.longitude
  json.title recipe.title
  json.id recipe.id
  json.content RecipesController.render(partial: 'recipes/recipe',
                                       locals: { recipe: recipe }, 
                                       format: :html).squish
end