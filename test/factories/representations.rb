FactoryGirl.define do
  factory :representation do
    association :constituency
    association :member

    trait :current do
      log_date Date.parse('1999-05-06')
      end_log_date nil
    end

    trait :ended do
      log_date Date.parse('1999-05-06')
      end_log_date Date.parse('2011-05-05')
    end
  end
end
