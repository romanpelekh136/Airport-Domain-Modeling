FactoryBot.define do
  factory :terminal do
    code { "A1" }
    association :airport
  end
end
