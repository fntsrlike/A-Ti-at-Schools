require_relative './utils'

class Quota

  def initialize(echelon, data = {})
    @echelon = echelon
    # @number = data[:number].to_i
    @country = Utils::countries[data[:country].strip.to_sym]
    e = data[:agencies].strip
    # @unit = data[:unit].strip.match(/^([^\(\)\[\]（）\n]+)((?:\(.+\))|(?:（.+）)|(?:\[.+\]))?/)[1]
    @unit = data[:unit].strip #.match(/^([^\[\]（）\n]+)((?:\[.+\]))?/)[1]
    @district = data[:district].strip
    @quota = data[:quota].strip
    # @ability = data[:ability]
    # @accommodation = data[:accommodation]
    # @service = data[:service]
    @count_of_members = data[:count_of_members].strip
    # @address = data[:address]
    # @phone = data[:phone]
    # @comment = data[:comment]
    # @code = data[:code]
  end

  def echelon
    @echelon
  end

  def quota
    @quota
  end

  def members
    @count_of_members
  end

  def name
    @unit
  end

  def country
    @country
  end

  def district
    @district
  end
end