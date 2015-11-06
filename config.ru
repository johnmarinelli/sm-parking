use Rack::Static,
  :urls => ['/images', '/js', '/css'],
  :root => 'public'

require_relative 'lib/parking_map/app'
run ParkingMapApp.new

