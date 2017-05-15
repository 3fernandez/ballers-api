class V1::CourtSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :coordinates, :created_at, :updated_at
end
