class CourtSerializer < ActiveModel::Serializer
  attributes :id, :address, :coordinates, :name, :create_at, :update_at
end
