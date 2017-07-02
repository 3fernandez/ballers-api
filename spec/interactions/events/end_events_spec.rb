require "rails_helper"

describe Events::EndEvents do
  describe ".run" do
    let(:now) { DateTime.current }

    it "changes status of events with end time older than now to ended" do
      Timecop.freeze(now) do
        create(:event, id: 24, end_time: 1.hour.ago)
        create(:event, :ongoing, id: 32, end_time: 2.hours.ago)
        described_class.run
        expect(Event.all).to all(be_ended)
      end
    end
  end
end
