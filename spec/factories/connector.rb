
FactoryBot.define do
  factory :connector do
    sequence(:name) do |n|
      Faker::Config.random = Random.new(n)
      Faker::Book.title
    end
    url { "www.#{name.parameterize}.com" }
  end
end
