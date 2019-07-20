# frozen_string_literal: true

require 'faraday'
require 'json'

def handler event
  conn = Faraday.new(
    url: 'https://dev.to',
    headers: {'Content-Type' => 'application/json'}
  )

  response = conn.get('api/articles')
  articles = JSON.parse(response.body).map do |article|
    {
      'id' => article['id'],
      'url' => article['url'],
      'title' => article['title']
    }
  end
  render json: { 'message' => 'articles of dev.to', 'articles' => articles }
end

