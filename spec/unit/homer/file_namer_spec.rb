require 'spec_helper'

describe Homer::FileNamer do
  let(:file_name) { 'foo/bar/baz.avi' }
  let(:episode_number) { Homer::EpisodeNumber.new(6, 12) }
  let(:show) { Homer::Show.new("The Simpsons") }
  let(:episode) { Homer::Episode.new(show, episode_number, "Homer the Great") }

  let(:name) { Homer::FileNamer.new.name_for_episode(episode, file_name) }

  it "returns the desired file name" do
    name.should == "foo/bar/The Simpsons - 06x12 - Homer the Great.avi"
  end
end
