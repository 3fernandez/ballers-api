class RecurrentEvent
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :start_time, type: Time
  field :end_time, type: Time
  field :recurrence, type: Hash

  embedded_in :recurrent, polymorphic: true
end
