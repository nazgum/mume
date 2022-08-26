class Char
  attr_accessor :name, :army, :race, :subrace, :sex, :alignment, :hometown

  def full_race
    if subrace
      "#{subrace_name} #{race_name}"
    else
      race_name
    end
  end

  def army_data
    Data.armies.find {|a| a[:id] == army}
  end

  def race_data
    Data.races.find {|r| r[:id] == race and r[:army] == army}
  end

  def subrace_data
    race_data[:subraces].find {|r| r[:id] == subrace}
  end

  def race_name
    race_data[:name]
  end

  def subrace_name
    subrace_data[:name]
  end

  def reset
    @name      = nil
    @army      = nil
    @race      = nil
    @subrace   = nil
    @sex       = nil
    @alignment = nil
    @hometown  = nil
  end
end