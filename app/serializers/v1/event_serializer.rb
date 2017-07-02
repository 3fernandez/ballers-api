module V1
  class EventSerializer < ActiveModel::Serializer
    belongs_to :court

    attributes %i[
      id
      status
      start_time
      end_time
      cancelation_reason
      created_at
      updated_at
    ]

    link :cancel, ->(_link) { url_for([:cancel, :v1, object]) }
  end
end
