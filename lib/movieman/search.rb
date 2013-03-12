require "faraday"
require 'typhoeus'

class Movieman::Search

  attr_accessor :hydra

  def initialize
    @hydra = Typhoeus::Hydra.new(max_concurrency: 20)
    @hydra.disable_memoization
  end


end
