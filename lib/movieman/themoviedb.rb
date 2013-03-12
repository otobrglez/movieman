require "faraday"
# require 'typhoeus'
require 'faraday_middleware/parse_oj'

module Movieman::Themoviedb
  extend self

  attr_accessor :api_key, :f

  def self.config(&block) instance_eval(&block); end

  self.f = Faraday.new(url: 'http://api.themoviedb.org') do |builder|
    builder.response :oj
    builder.adapter Faraday.default_adapter

    # builder.adapter  :typhoeus
    # builder.response :logger
  end

  def self.movie id
    f.get "/3/movie/#{id}?api_key=#{api_key}"
  end

  def self.search q, page=0
    f.get do |r|
      r.url "/3/search/movie"
      r.params['query'] = q
      r.params['api_key'] = api_key
      r.params['page'] = page unless page == 0
    end
  end
end
