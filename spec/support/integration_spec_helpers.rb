module IntegrationSpecHelpers
  def test_directory
    "/tmp/homer-test"
  end

  def test_files
    Dir[test_directory + "/**/*"].
      map{|f| f.gsub(test_directory + "/", '') }.
      sort
  end

  def bin_dir
    File.expand_path("../../../bin", __FILE__)
  end

  def test_file_path(file)
    File.join(test_directory, file)
  end

  def create_test_directory
    FileUtils.mkdir_p(test_directory) unless File.exists?(test_directory)
  end

  def remove_test_directory
    FileUtils.rm_rf(test_directory) if File.exists?(test_directory)
  end

  def string_to_files(string)
    string.split("\n").map(&:strip).reject{|f| f == ''}
  end

  def given_following_files(string)
    string_to_files(string).each do |file|
      file = test_file_path(file)
      FileUtils.mkdir_p(File.dirname(file))
      FileUtils.touch(file)
    end
  end

  def when_i_run(command)
    command = command.strip
    succeeded = system("cd #{test_directory} && #{bin_dir}/#{command}")

    raise "Command failed!" unless succeeded
  end

  def then_the_directory_should_contain_files(string)
    expected_files = string_to_files(string).sort
    actual_files = test_files

    actual_files.should == expected_files
  end
end
