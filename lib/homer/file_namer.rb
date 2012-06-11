class Homer::FileNamer
  def name_for_episode(episode, file_name)
    dir = File.dirname(file_name)
    extension = File.extname(file_name)

    return "#{dir}/#{episode.show_name} - #{episode.number} - #{episode.title}#{extension}"
  end
end
