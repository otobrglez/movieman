require "spec_helper"

describe Movieman::OMDBAPI do
  context "get movie" do
    subject { Movieman::OMDBAPI.movie "matrix" }
    its(:body){ should_not be_nil }
  end

  context "get search" do
    subject { Movieman::OMDBAPI.search "matrix" }
    its(:body){ should_not be_nil }
    # it { puts subject.body }
  end
end