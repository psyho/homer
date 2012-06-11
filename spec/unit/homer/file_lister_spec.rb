require 'spec_helper'

describe Homer::FileLister, :integration do
  let(:lister) { Homer::FileLister.new }

  it "lists the files in a given directory" do
    given_following_files %Q{
      foo.rb
      bar.txt
      test
      baz/bar.avi
    }

    lister.list(test_directory).should == ['bar.txt', 'foo.rb', 'test']
  end
end
