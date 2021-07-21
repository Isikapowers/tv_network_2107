class Network

  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    @shows.map do |show|
      show.characters.name
    end
  end

  def actors_by_show
    hash = {}
    @shows.each do |show|
      hash[show.name] = show.characters.actor
    end
    hash
  end

  def shows_by_actor
    hash = {}
    @shows.each do |show|
      actor = show.characters.actor
      hash[actor]
    end
    @shows.any? do |show|
      hash.keys(show.charaters.actor)
    end
    hash
  end

end
