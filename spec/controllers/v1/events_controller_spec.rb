require "rails_helper"

RSpec.describe V1::EventsController, type: :controller do
  describe "PATCH /v1/events/:id/cancel" do
    let(:event) { create(:event) }
    let(:cancelation_reason) { "raining" }

    before :each do
      allow(Events::CancelEvent).to receive(:run).and_call_original
    end

    subject do
      patch :cancel, params: {
        id: event.id,
        event: { cancelation_reason: cancelation_reason }
      }
    end

    it "respond success" do
      expect(subject).to have_http_status(200)
    end

    it "cancels the event" do
      subject
      expect(Events::CancelEvent).to have_received(:run).
        with(event: have_attributes(id: event.id), reason: cancelation_reason)
    end
  end
end
