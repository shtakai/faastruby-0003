require 'faastruby-rpc/test_helper'
require 'faastruby/spec_helper'
include FaaStRuby::SpecHelper

require "json_matchers/rspec"
require 'pry'
require 'vcr'

JsonMatchers.schema_root = "spec/support/api/schemas"

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
end
