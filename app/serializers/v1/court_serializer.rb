module V1
  class CourtSerializer < ActiveModel::Serializer
    has_many :recurrent_events
    has_many :events

    attributes %i[
      id
      name
      address
      coordinates
      map_url
      created_at
      updated_at
    ]
  end
end
