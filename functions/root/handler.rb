# frozen_string_literal: true

require 'faraday'
require 'json'

def handler event
  conn = Faraday.new(
    url: 'https://dev.to',
    headers: {'Content-Type' => 'application/json'}
  )

  response = conn.get('api/articles')
  puts JSON.parse(response.body).size
  render json: { 'message' => '肉' }
end

