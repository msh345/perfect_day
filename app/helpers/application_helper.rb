module ApplicationHelper
    def calculate_distance(your_latlong, destination_latlong) # as the crow flies
    radius = 6371
    d_lat  = to_radian(destination_latlong[0] - your_latlong[0])
    d_lon  = to_radian(destination_latlong[1] - your_latlong[1])
    lat_1  = to_radian(your_latlong[0])
    lat_2  = to_radian(destination_latlong[0])

    a = Math.sin(d_lat/2) * Math.sin(d_lat/2) +
        Math.sin(d_lon/2) * Math.sin(d_lon/2) * Math.cos(your_latlong[0]) * Math.cos(destination_latlong[0])

    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

    distance = (radius * c) * 0.6214
  end

  def to_radian(number)
    (number * Math::PI) / 180
  end
end
