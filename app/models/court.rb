class Court
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Geospatial

  field :name, type: String
  field :address, type: String
  field :coordinates, type: Point, sphere: true

  embeds_many :recurrent_events, as: :recurrent

  attr_reader :map_url

  def latitude
    coordinates.y
  end

  def longitude
    coordinates.x
  end

  def self.near_by(coordinates, distance = 5000)
    coordinates = coordinates.with_indifferent_access

    latitude = coordinates[:latitude] || coordinates[:lat]
    longitude = coordinates[:longitude] || coordinates[:lng]
    point = {
      "type" => "Point",
      "coordinates" => [longitude.to_f, latitude.to_f]
    }

    near(coordinates: point).
      max_distance(coordinates: distance)
  end

  def map_url
    params = {
      key: ENV["GOOGLE_MAPS_API_KEY"],
      zoom: 15,
      size: "350x190",
      markers: [latitude, longitude].join(",")
    }
    query_string = params.map { |key, value| "#{key}=#{value}" }.join("&")
    "http://maps.googleapis.com/maps/api/staticmap?#{map_style}#{query_string}"
  end

  def map_style
    "style=feature:administrative|element:labels.text.fill|color:0x444444&"\
      "style=feature:landscape|element:all|color:0xf2f2f2&"\
      "style=feature:poi|element:all|visibility:off&"\
      "style=feature:road|element:all|saturation:-100|lightness:45&"\
      "style=feature:road.highway|element:all|visibility:simplified&"\
      "style=feature:road.arterial|element:labels.icon|visibility:off&"\
      "style=feature:transit|element:all|visibility:off&"\
      "style=feature:water|element:all|color:0x46bcec|visibility:on&"\
  end

  def self.run
    Court.new(
      name: "Baskquete ICV",
      address: "Rua Maricá, 320, Praça Seca, Rio de Janeiro," \
      "State of Rio de Janeiro, Brazil",
      coordinates: { latitude: -22.8903048, longitude: -43.345593399999984 },
      recurrent_events: [
        {
          _type: "WeeklyEvent",
          start_time: "19:30 -0300",
          end_time: "21:30 -0300",
          days: :tuesday
        },
        {
          _type: "MonthlyEvent",
          start_time: "19:30 -0300",
          end_time: "21:30 -0300",
          days: { thursday: 3 }
        }
      ]
    )
  end
end
