require "spec_helper"

describe Movieman::RottenTomatoes do
  # http://developer.rottentomatoes.com/iodocs

  before { Movieman::RottenTomatoes.config do |c| c.api_key = "s4echk6yas3x8enhwjdp4k9r"; end }
  it { Movieman::RottenTomatoes.api_key.should match /s4/ }

  context "get movie" do
    subject { Movieman::RottenTomatoes.movie "770672122" }
    its(:body){ should_not be_nil }
    it { subject.body['title'].should match /toy story/i }
  end

  context "get search" do
    subject { Movieman::RottenTomatoes.search "matrix" }
    its(:body){ should_not be_nil }
  end
end
