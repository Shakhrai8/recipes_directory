require 'recipe_repository'

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

RSpec.describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  it "returns a list of recipes" do

    repo = RecipeRepository.new

    recipes = repo.all

    expect(recipes.length).to eq 2 # =>  2

    expect(recipes[0].id).to eq('1') # =>  1
    expect(recipes[0].name).to eq('Pizza') # =>  'Pizza'
    expect(recipes[0].average_time).to eq('20') # =>  '20'
    expect(recipes[0].rating).to eq('4.5') # =>  '4.5'

    expect(recipes[1].id).to eq('2') # =>  2
    expect(recipes[1].name).to eq('Salad') # =>  'Salad'
    expect(recipes[1].average_time).to eq('5') # =>  '5'
    expect(recipes[1].rating).to eq('3.7') # =>  '3.7'

  end

  it "returns a recipe with id 2" do

    repo = RecipeRepository.new

    recipe = repo.find(2)

    expect(recipe[0].id).to eq('2') # =>  1
    expect(recipe[0].name).to eq('Salad') # =>  'Salad'
    expect(recipe[0].average_time).to eq('5') # =>  '5'
    expect(recipe[0].rating).to eq('3.7') # => '3.7'
  end
end