class Homer::Injector
  include Dependor::AutoInject

  look_in_modules Homer

  def tvdb_api_key
    "5AA53D2972C927B1"
  end

  def tvdb
    TvdbParty::Search.new(tvdb_api_key)
  end
end
