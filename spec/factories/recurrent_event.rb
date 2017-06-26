FactoryGirl.define do
  factory :recurrent_event do
    trait :weekly do
      recurrence  every: :week, on: :friday, at: "8:00 PM".."10:00 PM"
      #duration 2.hours
    end
  end
end
