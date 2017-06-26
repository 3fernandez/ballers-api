module V1
  class EventSerializer < ActiveModel::Serializer
    belongs_to :court

    attributes %i[
      id
      status
      start_time
      end_time
      created_at
      updated_at
    ]
  end
end
