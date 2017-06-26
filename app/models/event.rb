class Event < BaseModel
  include SimpleEnum::Mongoid

  belongs_to :court

  as_enum :status, %i[upcoming]
  field :start_time, type: Time
  field :end_time, type: Time
end
