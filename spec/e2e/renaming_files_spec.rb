require 'spec_helper'

describe "Renaming Files", :integration do
  it "renames files in various formats" do
    given_following_files %Q{
      612.avi
    }

    when_i_run %Q{homer -r 'The Simpsons'}

    then_the_directory_should_contain_files %Q{
      The Simpsons - 06x12 - Homer the Great.avi
    }
  end
end
