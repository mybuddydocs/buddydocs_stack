FactoryBot.define do
  factory :document do
    user
    sequence(:name) do |n|
      Faker::Config.random = Random.new(n)
      Faker::Book.title
    end
    sequence(:generated_date) do |n|
      Faker::Config.random = Random.new(n)
      Faker::Date.between(from: 2.days.ago, to: Date.today)
    end
    url { "www.#{name.parameterize}.com" }
    origin { "#{name.parameterize}" }
    sequence(:reminder_date) do |n|
      Faker::Config.random = Random.new(n)
      Faker::Date.forward(days: 23)
    end
  end
end
