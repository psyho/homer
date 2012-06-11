require 'ostruct'

class Homer::ShowFinder
  takes :tvdb

  def find(show_name)
    series = find_series(show_name)
    episodes = list_all_episodes(series)
    return create_show(series, episodes)
  end

  private

  def find_series(show_name)
    tvdb.search(show_name).first
  end

  def list_all_episodes(series_hash)
    series = OpenStruct.new(id: series_hash["seriesid"])
    tvdb.get_all_episodes(series)
  end

  def create_show(series_hash, episodes)
    show = Homer::Show.new(series_hash["SeriesName"])
    add_episodes(show, episodes)
    show
  end

  def add_episodes(show, episodes)
    episodes.each do |episode|
      number = Homer::EpisodeNumber.new(episode.season_number.to_i,
                                        episode.number.to_i)
      show.add_episode(number, episode.name)
    end
  end
end
