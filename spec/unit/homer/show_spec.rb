require 'spec_helper'

describe Homer::Show do
  let(:show) { Homer::Show.new("The Simpsons") }

  it "returns the show name" do
    show.name.should == "The Simpsons"
  end

  it "finds episodes by number" do
    number = Homer::EpisodeNumber.new(6, 12)
    show.add_episode(number, "Homer the Great")

    episode = show.episode(number)

    episode.show.should == show
    episode.number.should == number
    episode.title.should == "Homer the Great"
  end

  it "raises EpisodeNotFound if episode by given number is not found" do
    number = Homer::EpisodeNumber.new(6, 12)
    other_number = Homer::EpisodeNumber.new(6, 13)
    show.add_episode(number, "Homer the Great")

    expect{
      show.episode(other_number)
    }.to raise_error(Homer::EpisodeNotFound)
  end
end
