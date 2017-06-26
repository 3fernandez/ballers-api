FactoryGirl.define do
  factory :event do
    start_time DateTime.current
    start_time 1.hour.from_now
  end
end
