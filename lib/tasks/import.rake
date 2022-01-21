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
end
