require "rails_helper"

describe Events::CreateUpcomingEvents, type: :interaction do
  let(:court) { create(:court) }
  subject { described_class.run!(court: court) }

  describe ".run" do
    let(:now) { DateTime.new(2017, 6, 25) }
    let(:event_time) { DateTime.new(2017, 6, 30, 19) }

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

    it "creates upcomming events to each court event recurrence" do
      Timecop.freeze(now) do
        expect(subject).to match_array [
          have_attributes(
            persisted?: true,
            status: :upcoming,
            start_time: event_time,
            end_time: event_time.change(hour: 22)
          )
        ]
      end
    end

    context "when already exists a upcoming event for the date" do
      it "does not create any event" do
        Timecop.freeze(now) do
          create(:event, court: court, starting_at: event_time)
          expect { subject }.not_to change(court.events, :count)
        end
      end
    end

    context "when exists a upcoming event that is not overlaping the date" do
      it "create a upcoming event" do
        Timecop.freeze(now) do
          create(:event, court: court, start_time: 48.hours.since(event_time))
          expect { subject }.to change(court.events, :count)
        end
      end
    end
  end
end
