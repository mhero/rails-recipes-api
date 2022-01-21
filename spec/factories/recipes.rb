FactoryBot.define do
  factory :recipe do
    name { "MyString" }
    preparation_time { "MyString" }
    number_of_comments { "MyString" }
    external_id { "MyString" }
    image_url { "MyString" }
    total_time_formatted { "MyString" }
    cook_time_formatted { "MyString" }
    author_tip { "MyString" }
    rating { "9.99" }
    budget { "MyString" }
    number_of_servings { 1 }
    difficulty { "MyString" }
  end
end
