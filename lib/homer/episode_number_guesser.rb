class Homer::EpisodeNumberGuesser
  def guess(file_name)
    case file_name
    when /(\d+)(\d\d)/
      number($1, $2)
    else
      Homer::EpisodeNumber.new(nil, nil)
    end
  end

  private

  def number(season, episode)
    return Homer::EpisodeNumber.new(season.to_i, episode.to_i)
  end
end
