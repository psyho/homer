class Homer::EpisodeNumber < Struct.new(:season, :episode)
  def to_s
    "%02dx%02d" % [season, episode]
  end
end
