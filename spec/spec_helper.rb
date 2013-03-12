require 'spork'
require 'rspec'
require 'vcr'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require 'rspec/autorun'

#Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  VCR.configure do |c|
    c.cassette_library_dir = "./rspec/cassettes"
    # c.hook_into :webmock
    c.hook_into :typhoeus
    c.configure_rspec_metadata!
  end

  RSpec.configure do |config|
		config.treat_symbols_as_metadata_keys_with_true_values = true

    config.before(:suite) do

		end

    config.before(:each) do

		end

    config.after(:each) do

		end

    # config.around(:each) do |example|
    #   name = example.metadata[:full_description].split(/\s+/, 2).join("/").downcase.gsub(/\s+/,"_").gsub(/[^\w\/]+/, "_")
    #   options = example.metadata.slice(:record, :match_requests_on).except(:example_group)
    #   VCR.use_cassette(name, options) { example.call }
    # end

  end
end

Spork.each_run do
  require "movieman"
end

