module V1
  class RecurrentEventSerializer < ActiveModel::Serializer
    attributes %i[
      id
      recurrence
      duration
    ]
  end
end
