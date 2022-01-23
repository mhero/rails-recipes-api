require 'time_parser'
namespace :curate do
  desc 'curate data from db'
  task convert_string_times_to_seconds: :environment do
    Recipe.all.each do |recipe|
      recipe.update(
        preparation_time_seconds: TimeParser.new(recipe.preparation_time).time,
        cook_time_seconds: TimeParser.new(recipe.cook_time_formatted).time,
        total_time_seconds: TimeParser.new(recipe.total_time_formatted).time
      )
    end
  end
end