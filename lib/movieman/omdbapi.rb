require "faraday"
# require 'typhoeus'
require 'faraday_middleware/parse_oj'

module Movieman::OMDBAPI
  # http://www.omdbapi.com/

  extend self

  attr_accessor :f

  self.f = Faraday.new(url: 'http://www.omdbapi.com') do |builder|
    builder.response :oj
    builder.adapter Faraday.default_adapter

    # builder.response :logger
    # builder.adapter :typhoeus
  end

  def self.movie t
    f.get "/" do |r|
      r.params["t"] = t
    end
  end

  def self.search q
    f.get do |r|
      r.url "/"
      r.params['s'] = q
    end
  end
end
