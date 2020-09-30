FactoryBot.define do
  # factory :user do
  #   id {1}
  #   email {"test@user.com"}
  #   password {"qwerty"}
  #   first_name {"test"}
  #   last_name {"test"}
  #   # Add additional fields as required via your User model
  # end
  factory :user do
    sequence(:first_name) do |n|
      Faker::Config.random = Random.new(n)
      Faker::Name.first_name
    end
    sequence(:last_name) do |n|
      Faker::Config.random = Random.new(n)
      Faker::Name.last_name
    end

    email { "#{first_name.parameterize}.#{last_name.parameterize}@example.com" }
    password { 'password123' }
  end

  factory :admin do
    id {2}
    email {"test@admin.com"}
    password {"qwerty"}
    admin {true}
    first_name {"test"}
    last_name {"test"}
  end
end
