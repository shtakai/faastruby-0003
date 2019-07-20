# frozen_string_literal: true

require 'json'

def handler event
  render json: { 'message' => 'Hello, World!' }
end

