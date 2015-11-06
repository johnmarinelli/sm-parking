require_relative 'lot_requester'
require_relative 'hash'
require_relative 'array'

class ParkingMapApp
  def call(env)
    req = Rack::Request.new env

    case req.path_info
    when /\/$/
      [
        200,
        {
          'Content-Type' => 'text/html',
          'Cache-Control' => 'public, max-age=86400'
        },
        File.open('public/index.html', File::RDONLY)
      ]
    when /lots.json/
      err = 'API down'
      lots = nil
      begin
        lots = LotRequester.new.get_lots_coordinates_json
      rescue IOError => e
        err = e
      end

      [
        200,
        {
          'Content-Type' => 'application/json'
        },
        [lots || err]
      ]
    end
  end
end
