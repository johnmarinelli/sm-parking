require 'httparty'
require 'nokogiri'
require_relative 'hash'

class LotRequester
  # makes an api call and receives xml.  turns xml into a Nokogiri::XML doc
  def get_lots
    res = HTTParty.get 'https://parking.api.smgov.net/lots', :headers => { "Accept" => "text/xml" }

    raise IOError if res.response.class != Net::HTTPOK
    
    # the point of this app was to exercise Nokogiri xml parsing, so convert res to an xml string
    Nokogiri::XML res.parsed_response.to_xml
  end
  
  # turns the Nokogiri::XML doc into an array of pairs
  def get_lots_coordinates
    xml = get_lots
    coords = xml.xpath '/ArrayOflot/lot/latitude | /ArrayOflot/lot/longitude'
    coords.each_slice(2).to_a.map { |p| [p[0].text, p[1].text] }
  end

  def get_lots_coordinates_json
    get_lots_coordinates.to_json
  end
end
