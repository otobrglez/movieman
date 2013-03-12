require "faraday"
# require 'typhoeus'
require 'faraday_middleware/parse_oj'

module Movieman::RottenTomatoes
  extend self

  attr_accessor :api_key, :f

  def self.config(&block) instance_eval(&block); end

  self.f = Faraday.new(url: 'http://api.rottentomatoes.com') do |builder|
    builder.response :oj
    builder.adapter Faraday.default_adapter

    # builder.response :logger
    # builder.adapter  :typhoeus
  end

  def self.movie id
    f.get "/api/public/v1.0/movies/#{id}.json?apikey=#{api_key}"
  end

  def self.cast id
    f.get "/api/public/v1.0/movies/#{id}/cast.json?apikey=#{api_key}"
  end

  def self.search q, page_limit=0, page=0
    f.get do |r|
      r.url "/api/public/v1.0/movies.json"
      r.params['q'] = q
      r.params['api_key'] = api_key
      r.params['page_limit'] = page_limit unless page_limit == 0
      r.params['page'] = page unless page == 0
    end
  end
end
