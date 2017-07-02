require "rails_helper"

describe Events::CancelEvent do
  describe ".run" do
    let(:event) { create(:event) }
    let(:reason) { "it was raining a lot" }

    subject { described_class.run!(event: event, reason: reason) }

    it "returns event" do
      expect(subject).to eq event
    end

    it "change status to cancelled" do
      expect { subject }.to change(event, :status).to(:cancelled).
        and change(event, :cancelation_reason).to(reason)
    end
  end
end
