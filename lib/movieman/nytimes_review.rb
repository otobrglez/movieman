require "faraday"
# require 'typhoeus'
require 'faraday_middleware'

module Movieman::NYTimes_review
  extend self

  attr_accessor :api_key, :f

  def self.config(&block) instance_eval(&block); end

  self.f = Faraday.new(url: 'http://api.nytimes.com') do |builder|
    builder.adapter Faraday.default_adapter
    builder.use FaradayMiddleware::ParseXml,  :content_type => /\bxml$/

    # builder.adapter  :typhoeus
    # builder.response :logger
  end

  def self.search q
    f.get do |r|
      r.url "/svc/movies/v2/reviews/search.xml"
      r.params['query'] = q
      r.params['api-key'] = api_key
    end
  end
end
