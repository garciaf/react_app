
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    author "John Do"
    text "I would like to comment"
  end
end
