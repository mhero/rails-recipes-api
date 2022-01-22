# frozen_string_literal: true

namespace :recipes do
  desc 'import script'
  task add_external_id: :environment do
    # This script is used to add external_id to recipes
    attributes = []
    file = File.join(Rails.root, 'recipes.json')
    File.open(file).each_line do |line|
      without_id = JSON.parse(line).to_h
      attributes << without_id.merge(external_id: SecureRandom.uuid).to_json
    end

    IO.write('recipes.json', attributes.join("\n"))
  end

  task check_fields: :environment do
    # This script will collect all fields in the json file so we can add/model
    attributes = []
    file = File.join(Rails.root, 'recipes.json')
    File.open(file).each_line do |line|
      attributes.push(*JSON.parse(line).keys)
    end
    p attributes.to_set
  end

  task insert_users: :environment do
    # This script will insert users from the json file
    users = []
    file = File.join(Rails.root, 'recipes.json')
    File.open(file).each_line do |line|
      record = JSON.parse(line).to_h
      users.push(User.new(handle: record['author']))
    end

    User.import users
  end

  task insert_recipes: :environment do
    # This script will insert recipes from the json file

    file = File.join(Rails.root, 'recipes.json')
    recipes = []
    users = fetch_users
    File.open(file).each_line do |line|
      record = JSON.parse(line).to_h
      recipes << new_recipe(record, users[record['author']])
    end

    Recipe.import recipes, recursive: true
  end

  private

  def new_recipe(record, user)
    recipe = Recipe.new(
      name: record['name'],
      preparation_time: record['prep_time'],
      number_of_comments: record['nb_comments'],
      external_id: record['external_id'],
      image_url: record['image'],
      total_time_formatted: record['total_time'],
      cook_time_formatted: record['cook_time'],
      author_tip: record['author_tip'],
      rating: record['rate'],
      budget: record['budget'],
      number_of_servings: record['people_quantity'],
      difficulty: record['difficulty'].downcase,
      user_id: user
    )

    record['ingredients'].each do |ingredient|
      recipe.ingredients.build(description: ingredient)
    end

    record['tags'].each do |tag|
      recipe.tags.build(description: tag)
    end

    recipe
  end

  def fetch_users
    Hash[*User.all.pluck(:handle, :id).flatten]
  end
end
