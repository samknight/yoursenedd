FactoryGirl.define do
  factory :speech do
    association :member, :factory => :member
    association :debate, :factory => :debate
    content "Lorem Ipsum"
    log_date Date.today
  end
end
