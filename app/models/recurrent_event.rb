class RecurrentEvent
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :recurrence, type: Hash
  field :duration, type: Integer

  embedded_in :recurrent, polymorphic: true
end
