require 'spec_helper'

describe Homer::FileRenamer, :integration do
  def rename(old_file, new_file)
    renamer = Homer::FileRenamer.new
    renamer.rename(test_file_path(old_file), test_file_path(new_file))
  end

  it "renames files" do
    given_following_files %Q{
      foo.avi
      bar.mpg
    }

    rename('foo.avi', 'asdf.avi')

    then_the_directory_should_contain_files %Q{
      asdf.avi
      bar.mpg
    }
  end
end
