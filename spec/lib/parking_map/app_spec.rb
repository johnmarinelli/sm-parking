require 'rack/test'

describe 'parking map app' do
  include Rack::Test::Methods

  def app
    ParkingMapApp.new
  end

  it 'gets index' do
    get '/'
    expect(last_response.status).to eq(200)
  end

  it 'gets lot json info' do
    get '/lots'
    expect(last_response.status).to eq(200)
    expect(last_response.content_type).to eq('application/json')
  end

end
