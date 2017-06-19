module V1
  class RecurrentEventSerializer < ActiveModel::Serializer
    attributes %i[
      id
      start_time
      end_time
      recurrence
    ]
  end
end
