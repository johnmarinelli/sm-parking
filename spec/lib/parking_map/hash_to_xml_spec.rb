require_relative '../../spec_helper'

describe 'monkey patched hash' do
  it 'should create an xml string out of an arbitrarily deep hash' do
    h = {
          :head => {
            :title => "Hello world"
          },
          :body => {
            :div => {
              :p => 'This is a test.'
            }
          }
    }

    expect(h.to_xml).to eq('<head><title>Hello world</title></head><body><div><p>This is a test.</p></div></body>')
  end
end
