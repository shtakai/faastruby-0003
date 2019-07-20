require 'faastruby-rpc/test_helper'
require 'faastruby/spec_helper'
include FaaStRuby::SpecHelper

require 'pry'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end
