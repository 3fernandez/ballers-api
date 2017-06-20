class Event < BaseModel
  belongs_to :court

  field :status, type: String
  field :start_time, type: Time
  field :end_time, type: Time
end
