require "movieman/version"
module Movieman; end

module Movieman
  CLASS_MAP={
    rotten_tomatoes:  "RottenTomatoes",
    themoviedb:       "Themoviedb",
    nytimes_review:   "NYTimes_review",
    omdbapi:          "OMDBAPI"
  }
end

Movieman::CLASS_MAP.keys.each do |cp|
  require "movieman/#{cp}"
end

require "movieman/search"