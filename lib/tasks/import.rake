# frozen_string_literal: true

namespace :recipes do
  desc 'import script'
  task check_fields: :environment do
    # This script will collect all fields in the json file so we can add/model
    attributes = []
    file = File.join(Rails.root, 'recipes.json')
    File.open(file).each_line do |line|
      attributes.push(*JSON.parse(line).keys)
    end
    p attributes.to_set
  end
end
