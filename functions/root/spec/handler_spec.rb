# frozen_string_literal: true

require 'spec_helper'
require 'handler'
require 'json'

describe '#handler' do
  let(:body) { handler(event).body }
  let(:event) {
    Event.new(
      body: nil, query_params: {},
      headers: {}, context: nil
    )
  }

  context 'when function is requested' do
    let(:response_value) {
      JSON.parse(body).values.first
    }
    it 'returns a String' do
      expect(body).to be_a(String)
    end
    it "returns 'Hello, World!'" do
      expect(response_value).to eq('Hello, World!')
    end
  end
end
