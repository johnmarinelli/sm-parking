require 'nokogiri'

Dir[File.dirname(__FILE__) + '/parking_map/*.rb'].each do |f|
  require f
end
