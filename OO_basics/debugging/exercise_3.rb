class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  def ==(other)
    latitude == other.latitude && longitude == other.longitude
  end
end

# Example

ada = Person.new('Ada')
# new Person object with '@name' instance variable set to Ada
ada.location = GeoLocation.new(53.477, -2.236)
# ada Person object '@location' instance variable set to a
# Geolocation object with '@latitude' and '@longitude' instance variables

grace = Person.new('Grace')
# new Person object with '@name' instance variable set to "Grace"
grace.location = GeoLocation.new(-33.89, 151.277)
# grace Person object '@location' instance variable set to a
# Geolocation object with '@latitude' and '@longitude' instance variables

ada.teleport_to(-33.89, 151.277)
#ada @location set to a Geolocation object with '@latitude'
#and '@longitude' coordinates that match grace's

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false
p ada.location.object_id
p grace.location.object_id
