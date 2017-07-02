FactoryGirl.define do
  factory :event do
    association :court

    status :upcoming
    start_time 1.hour.from_now
    end_time 3.hour.from_now

    transient do
      starting_at nil
    end

    after(:build) do |event, evaluator|
      if evaluator.starting_at.present?
        event.start_time = evaluator.starting_at
        event.end_time = 3.hours.since(evaluator.starting_at)
      end
    end

    trait :ongoing do
      status :ongoing
      start_time 1.hour.ago
      end_time 2.hours.from_now
    end

    trait :ended do
      status :ended
      start_time 3.hours.ago
      end_time 1.hour.ago
    end

    trait :starting_at do
      status :ended
      start_time 3.hours.ago
      end_time 1.hour.ago
    end
  end
end
