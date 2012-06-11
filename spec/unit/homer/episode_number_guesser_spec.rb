require 'spec_helper'

describe Homer::EpisodeNumberGuesser do
  def number(season, episode)
    Homer::EpisodeNumber.new(season, episode)
  end

  def guess(name)
    Homer::EpisodeNumberGuesser.new.guess(name)
  end

  it "returns episode 06x12 for 612" do
    guess("the.simpsons.612.avi").should == number(6, 12)
  end

  it "returns a nil episode for asdf" do
    guess("the.simpsons.asdf.avi").should == number(nil, nil)
  end
end
