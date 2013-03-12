require "spec_helper"

describe Movieman::NYTimes_review do

  before { Movieman::NYTimes_review.config do |c| c.api_key = "e9118adb6861ac521a60491fd7cebfa0:11:67419470"; end }

  context "get search" do
    subject { Movieman::NYTimes_review.search "matrix" }
    its(:body){ should_not be_nil }
  end
end