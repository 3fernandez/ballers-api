require "rails_helper"

describe Event, type: :model do
  it "sorts by start_time by default" do
    event1 = create(:event, starting_at: DateTime.current)
    event2 = create(:event, starting_at: 3.hours.ago)
    event3 = create(:event, starting_at: 10.hours.from_now)
    expect(Event.all).to eq [event2, event1, event3]
  end

  describe ".statuses" do
    it do
      expect(described_class.statuses.hash).to eq(
        "upcoming" => 0,
        "ongoing" => 1,
        "ended" => 2,
        "cancelled" => 3
      )
    end
  end
end
