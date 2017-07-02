class Event < BaseModel
  include SimpleEnum::Mongoid

  belongs_to :court

  as_enum :status, %i[upcoming ongoing ended cancelled]
  field :start_time, type: Time
  field :end_time, type: Time

  default_scope { order(start_time: :asc) }
end
