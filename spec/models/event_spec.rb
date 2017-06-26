require "rails_helper"

describe Event, type: :model do
  it ".statuses" do
    expect(described_class.statuses.hash).to eq(
      "upcoming" => 0
    )
  end
end
