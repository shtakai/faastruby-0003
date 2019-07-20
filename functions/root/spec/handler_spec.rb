# frozen_string_literal: true

require 'spec_helper'
require 'handler'
require 'json'

describe '#handler' do
  let(:body) do
    VCR.use_cassette('dev.to/api/articles') do
      handler(event).body
    end
  end

  let(:event) {
    Event.new(
      body: nil, query_params: {},
      headers: {}, context: nil
    )
  }

  context 'when function is requested' do
    let(:json) { JSON.parse(body) }
    it { expect(json['message']).to eq('articles of dev.to') }
    it { expect(json['articles']).to be_an_instance_of(Array) }
  end
end
