class Homer::FileLister
  def list(directory)
    regular_files = Dir[directory + "/*"].select{|f| File.file?(f)}
    regular_files.map{|f| File.basename(f) }.sort
  end
end
