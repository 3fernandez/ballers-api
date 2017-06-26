require "rails_helper"

describe Courts::CreateUpcomingEvents, type: :interaction do
  let(:court) { build(:court) }
  subject { described_class.run!(court: court) }

  describe ".run" do
    let(:date) { DateTime.new(2017, 6, 25) }
    let(:event_date) { DateTime.new(2017, 6, 30) }

    before :each do
      court.recurrent_events << build(
        :recurrent_event,
        :weekly,
        duration: 3.hours,
        recurrence: {
          every: :week,
          on: :friday,
          at: "7:00 PM"
        }
      )
    end

    it "creates upcomming events to a court" do
      Timecop.freeze(date) do
        expect(subject).to match_array [
          have_attributes(
            status_cd: Event.statuses[:upcoming],
            start_time: event_date.change(hour: 19),
            end_time: event_date.change(hour: 22)
          )
        ]
      end
    end
  end
end
