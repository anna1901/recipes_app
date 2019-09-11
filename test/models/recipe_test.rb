require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end
  test "saves valid recipe" do
    recipe = @user.recipes.build(name: "name", description: "description", category: "breakfast")
    assert recipe.save, "Didn't save valid recipe"
  end

  test "name must be present" do
    recipe = @user.recipes.build(name: "", description: "description", category: "breakfast")
    assert_not recipe.save, "Saved recipe without name"
  end

  test "description must be present" do
    recipe = @user.recipes.build(name: "name", description: "", category: "breakfast")
    assert_not recipe.save, "Saved recipe without description"
  end

  test "category must be present" do
    recipe = @user.recipes.build(name: "name", description: "description", category: "")
    assert_not recipe.save, "Saved recipe without category"
  end

end
