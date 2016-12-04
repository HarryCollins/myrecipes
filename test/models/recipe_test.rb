require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    #primary key not created for new chef if "new" is used, as it doesn't hit the database
    #instead, "create" must be used - in test this will commit to the test database
    #in a sandbox mode - ie it wont stay in the database after the test has been run
    @chef = Chef.create(chefname:"Bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "Spanish Risotto", summary: "Very nice!", description: "Heat it all in a nice large pan, then serve. Yummy!")
  end

  test "recipe should be valid" do
  	assert @recipe.valid?
  end

  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "name length should not be too short" do
    @recipe.name = "a" * 4
    assert_not @recipe.valid?  	
  end

  test "name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end

  test "summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
 
  test "summary length should not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?  
  end

  test "summary length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
 
  test "description length should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?  
  end

  test "description length should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end

end