require 'spec_helper'

describe Homer::ShowFinder, :integration, :vcr do
  let(:injector) { Homer::Injector.new }
  let(:show_finder) { injector.show_finder }

  it "finds the shows by name in tvdb database" do
    show = show_finder.find("the simpsons")

    show.name.should == "The Simpsons"
  end

  it "returns the show with episodes" do
    episode_number = Homer::EpisodeNumber.new(6, 12)
    show = show_finder.find("the simpsons")
    episode = show.episode(episode_number)

    episode.show.should == show
    episode.title.should == "Homer the Great"
    episode.number.should == episode_number
  end
end
