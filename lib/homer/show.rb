class Homer::Show
  attr_reader :name

  def initialize(name)
    @name = name
    @episodes = {}
  end

  def episode(episode_number)
    @episodes[episode_number] or
      raise Homer::EpisodeNotFound.new(episode_number)
  end

  def add_episode(episode_number, title)
    episode = Homer::Episode.new(self, episode_number, title)
    @episodes[episode_number] = episode
  end
end
