require 'spec_helper'

describe Homer::Renamer do
  fake(:show)
  fake(:episode_number_guesser)
  fake(:file_namer)
  fake(:file_renamer)

  let(:file_name) { "some/file/name.avi" }
  let(:episode_number) { Homer::EpisodeNumber.new(6, 12) }
  let(:episode) { Homer::Episode.new(episode_number, title) }
  let(:title) { "Homer the Great" }
  let(:new_name) { "new/file/name.avi" }

  let(:renamer) {
    Homer::Renamer.new(episode_number_guesser, file_namer, file_renamer)
  }

  before do
    episode_number_guesser.stubs(:guess).returns(episode_number)
    file_namer.stubs(:name_for_episode).returns(new_name)
  end

  it "finds out the episode number based on the file name" do
    episode_number_guesser.expects(:guess).
      with(file_name).
      returns(episode_number)

    renamer.rename(file_name, show)
  end

  it "finds the episode based on the episode number" do
    show.expects(:episode).with(episode_number).returns(episode)

    renamer.rename(file_name, show)
  end

  it "does nothing if the episode cannot be found" do
    show.expects(:episode).with(episode_number).raises(Homer::EpisodeNotFound)
    file_renamer.expects(:rename).never

    renamer.rename(file_name, show).should be_false
  end

  it "renames the file name using on the episode name" do
    file_renamer.expects(:rename).with(file_name, new_name)

    renamer.rename(file_name, show).should == new_name
  end
end
