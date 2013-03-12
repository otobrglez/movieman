# Movieman

Movieman is wrapper for sites/APIs that provide information about movies.

## Installation

Add this line to your application's Gemfile:

    gem 'movieman'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install movieman

## Services

### RottenTomatoes

[API Docs for Rotten Tomatoes](http://developer.rottentomatoes.com/iodocs)

	Movieman::RottenTomatoes.config do |c|
    	c.api_key = "<key here>"
    end

    movie = Movieman::RottenTomatoes.movie "770672122"
    movies = Movieman::RottenTomatoes.search "Matrix"
    
### The Movie Database

[API Docs for The Movie Database.](http://docs.themoviedb.apiary.io/#movies)

	Movieman::Themoviedb.config do |c|
    	c.api_key = "<key here>"
    end
    
    movie = Movieman::Themoviedb.movie "605"
    movies = Movieman::Themoviedb.search "Matrix"

### New York Times Movie Reviews

[Docs for NY Times API](http://developer.nytimes.com)

	Movieman::NYTimes_review.config do |c|
    	c.api_key = "<key here>"
    end
    
    movies = Movieman::NYTimes_review.search "matrix"

### The Open Movie Database API

[The Open Movie Database API](http://www.omdbapi.com/)

	movies = Movieman::OMDBAPI.search "matrix"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
