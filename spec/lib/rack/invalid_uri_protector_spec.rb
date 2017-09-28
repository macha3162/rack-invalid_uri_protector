require 'spec_helper'

RSpec.describe Rack::InvalidUriProtector do
  include Rack::Test::Methods

  let(:app) do
    Rack::Builder.new {
      use Rack::InvalidUriProtector
      run lambda {|env| [200, {}, ['Hello World']]}
    }.to_app
  end

  let (:bad_request) {{'REQUEST_URI' => '?%28t%B3odei%29'}}

  describe 'with trailing %' do
    it 'normal request' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq('Hello World')
    end

    it 'invalid request' do
      test = Rack::InvalidUriProtector.new(app)
      expect(test.call(bad_request)).to eq([400, {}, ['Bad request']])
    end
  end
end
