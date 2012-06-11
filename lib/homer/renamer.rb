class Homer::Renamer
  takes :episode_number_guesser, :file_namer, :file_renamer

  def rename(file_name, show)
    episode_number = episode_number_guesser.guess(file_name)
    episode = show.episode(episode_number)
    new_name = file_namer.name_for_episode(episode, file_name)
    file_renamer.rename(file_name, new_name)
    return new_name
  rescue Homer::EpisodeNotFound
    return false
  end
end
