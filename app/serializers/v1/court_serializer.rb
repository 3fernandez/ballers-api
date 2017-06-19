module V1
  class CourtSerializer < ActiveModel::Serializer
    attributes %i[
      id
      name
      address
      coordinates
      map_url
      created_at
      updated_at
    ]
    has_many :recurrent_events
  end
end
