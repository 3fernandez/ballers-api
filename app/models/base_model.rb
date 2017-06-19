class BaseModel < ActiveModelSerializers::Model
  include Mongoid::Document
  include Mongoid::Timestamps
end
