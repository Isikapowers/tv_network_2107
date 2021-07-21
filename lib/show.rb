class Show

  attr_reader :name, :creator, :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    total = 0
    @characters.each do |character|
      total += character.salary
    end
    total
  end

  def highest_paid_actor
    highest = @characters.max_by do |character|
      character.salary
    end
    name = highest.actor
  end

  def actors
    actors = @characters.map do |character|
      character.actor
    end
  end

end
