require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
    @password = '123456789'
    @city = "Brasov"
    @address = "Vulturului 14"
    @zipcode = " "
    @confirmed_user = User.create(email: "#{rand(50000)}@example.com", password: @password, city: @city, address: @address, zipcode: @zipcode)
  end

  test "should get index" do
    get recipes_url
    assert_response :success
  end

  test "should get new" do
    sign_in(user: @confirmed_user, password: '123456789')
    get new_recipe_url
    assert_response :success
  end

  test "should create recipe" do
    sign_in(user: @confirmed_user, password: '123456789')
    assert_difference('Recipe.count') do
      post recipes_url, params: { recipe: { recipe: @recipe.recipe, title: @recipe.title, city: @city, address: @address, zipcode: @zipcode } }
    end

    assert_redirected_to recipe_url(Recipe.last)
  end

  test "should show recipe" do
    get recipe_url(@recipe)
    assert_response :success
  end

  test "should get edit" do
    sign_in(user: @confirmed_user, password: '123456789')
    get edit_recipe_url(@recipe)
    assert_response :success
  end

  test "should update recipe" do
    sign_in(user: @confirmed_user, password: '123456789')
    patch recipe_url(@recipe), params: { recipe: { recipe: @recipe.recipe, title: @recipe.title, city: @city, address: @address, zipcode: @zipcode } }
    assert_response :success
  end

  test "should destroy recipe" do
    sign_in(user: @confirmed_user, password: '123456789')
    assert_difference('Recipe.count', -1) do
      delete recipe_url(@recipe)
    end

    assert_redirected_to recipes_url
  end
end
