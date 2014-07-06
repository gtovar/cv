FactoryGirl.define do
  factory :experience do
    name {Faker::Company.name}
    description {Faker::Lorem.paragraph}
    start_date 2.month.ago
    end_date 5.day.ago
  end

end
