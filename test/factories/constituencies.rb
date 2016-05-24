FactoryGirl.define do
  factory :constituency do
    name "Cardiff Central"
    start_date Date.parse('1999-05-06')

    trait :old do
      end_date Date.parse('2007-05-02')
    end
  end
end
