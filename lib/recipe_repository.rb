require_relative './recipe'

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    recipes = []
    # Executes the SQL query:
    sql = 'SELECT id, name, average_time, rating FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |recipe|
      recipe_inst = Recipe.new

      recipe_inst.id = recipe['id']
      recipe_inst.name = recipe['name']
      recipe_inst.average_time = recipe['average_time']
      recipe_inst.rating = recipe['rating']

      recipes << recipe_inst
    end
    return recipes
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    recipes = []
    # Executes the SQL query:
    sql = 'SELECT id, name, average_time, rating FROM recipes WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)

    result_set.each do |recipe|
      recipe_inst = Recipe.new

      recipe_inst.id = recipe['id']
      recipe_inst.name = recipe['name']
      recipe_inst.average_time = recipe['average_time']
      recipe_inst.rating = recipe['rating']

      recipes << recipe_inst
    end
    return recipes 
  end

end