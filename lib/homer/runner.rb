class Homer::Runner
  takes :show_finder, :file_lister, :renamer

  def run(argv)
    show = show_finder.find(argv.last)
    files = file_lister.list(".")
    files.each do |file|
      renamer.rename(file, show)
    end
  end
end
