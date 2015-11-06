require_relative '../../spec_helper'

describe LotRequester do
  before do
    @lot_requester = LotRequester.new
  end

  it 'should return a Nokogiri XML document with lot info' do
    expect(@lot_requester.get_lots.class).to eq(Nokogiri::XML::Document)
  end

  it 'should return an array of coordinate pairs' do
    expect(@lot_requester.get_lots_coordinates.class).to eq(Array)
    expect(@lot_requester.get_lots_coordinates[0].class).to eq(Array)
  end

  it 'should return an array of coordinate pairs in json format' do
    expect(@lot_requester.get_lots_coordinates_json.class).to eq(String)
  end
end
