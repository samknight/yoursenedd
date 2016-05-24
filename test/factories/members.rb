FactoryGirl.define do
  factory :member do
    forename "Carwyn"
    surname "Jones"

    trait :current do
      representations { |r| [FactoryGirl.build(:representation, :current)] }
    end

    trait :left do
      representations { |r| [FactoryGirl.build(:representation, :ended)] }
    end

    trait :left_two_representations do
      representations { |r| [
        FactoryGirl.build(:representation,
          log_date: Date.parse('1999-05-06'), end_log_date: Date.parse('2007-05-05')),
        FactoryGirl.build(:representation,
          log_date: Date.parse('2007-05-06'), end_log_date: Date.parse('2011-05-04'))
      ] }
    end

    trait :api_key do
      api_keys { |a| [FactoryGirl.build(:api_key)] }
    end
  end
end
