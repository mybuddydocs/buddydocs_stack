
FactoryBot.define do
  factory :credential do
    sequence(:login) do |n|
      Faker::Config.random = Random.new(n)
      Faker::Company.name
    end
    sequence(:password) do |n|
      Faker::Config.random = Random.new(n)
      Faker::Lorem.word
    end
  end
end
