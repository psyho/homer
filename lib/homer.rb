require 'dependor'
require 'dependor/shorty'

require 'tvdb_party'

# does not work with file store for some reason
TvdbParty::Search.cache.store =
  HTTParty::Icebox::Store::MemoryStore.new timeout: 60

module Homer
  autoload :Episode, 'homer/episode'
  autoload :EpisodeNotFound, 'homer/episode_not_found'
  autoload :EpisodeNumber, 'homer/episode_number'
  autoload :EpisodeNumberGuesser, 'homer/episode_number_guesser'
  autoload :FileLister, 'homer/file_lister'
  autoload :FileNamer, 'homer/file_namer'
  autoload :FileRenamer, 'homer/file_renamer'
  autoload :Injector, 'homer/injector'
  autoload :Renamer, 'homer/renamer'
  autoload :Runner, 'homer/runner'
  autoload :Show, 'homer/show'
  autoload :ShowFinder, 'homer/show_finder'
  autoload :VERSION, 'homer/version'

  def self.run(argv)
    injector = Injector.new
    injector.runner.run(argv)
  end
end
