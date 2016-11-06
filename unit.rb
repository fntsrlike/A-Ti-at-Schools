class Unit
  def initialize(country, district, name)
    @name = name
    @country = country
    @district = district
    @echelons = {}
  end

  def country
    @country
  end

  def district
    @district
  end

  def name
    @name
  end

  def echelons
    @echelons
  end

  def add_echelons(echelon, quota)
    @echelons[echelon.to_i] = quota.to_i
  end

  def get_echelon_quota(echelon)
    @echelons[echelon.to_i] || 0
  end
end