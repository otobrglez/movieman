require "spec_helper"

describe Movieman::Themoviedb do
  # Read: http://docs.themoviedb.apiary.io/#movies

  before { Movieman::Themoviedb.config do |c| c.api_key = "a79bb85972d2594f4d8a1c37c7be5a3f"; end }

  context "get movie" do
    subject { Movieman::Themoviedb.movie "605" }
    its(:body){ should_not be_nil }
    it { subject.body['title'].should match /matrix/i }
  end

  context "get search" do
    subject { Movieman::Themoviedb.search "matrix" }
    its(:body){ should_not be_nil }
  end

end
