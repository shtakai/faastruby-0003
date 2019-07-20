# frozen_string_literal: true

require 'spec_helper'
require 'handler'
require 'json'

RSpec.describe '#handler' do
  let(:response) do
    VCR.use_cassette('dev.to/api/articles') do
      handler(event)
    end
  end

  let(:event) do
    Event.new(
      body: nil, query_params: {},
      headers: {}, context: nil
    )
  end

  context 'when function is requested' do
    let(:body) { JSON.parse(response.body) }

    it { expect(body['message']).to eq('articles of dev.to') }
    it { expect(body['articles']).to be_an_instance_of(Array) }
    it { expect(response.status).to eq 200 }
    it { expect(response).to match_json_schema('articles') }
  end
end
