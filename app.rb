require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory_test')

recipes_repo = RecipeRepository.new

# Print out each record from the result set .
recipes_repo.all.each_with_index do |recipe, index|
  puts "#{index + 1} - #{recipe.name} - #{recipe.average_time} - #{recipe.rating}"
end