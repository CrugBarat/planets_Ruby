class StarSystem

  attr_reader :name, :planets

  def initialize(name, planets)
      @name = name
      @planets = planets
    end

    def planet_names()
      return @planets.map {|planet| planet.name}
    end

    def get_planet_by_name(planet_name)
      return @planets.find {|planet| planet_name == planet.name}
    end

    def get_largest_planet()
      return @planets.max { |a, b| a.diameter <=> b.diameter }
    end

    def get_smallest_planet()
      return @planets.min { |a, b| a.diameter <=> b.diameter }
    end

    def get_planets_with_no_moons()
      return @planets.select {|planet| planet.number_of_moons == 0}
    end

    def get_planets_with_more_moons(number)
      new_planets = @planets.select {|planet| planet.number_of_moons > number}
      return new_planets.map {|planet| planet.name}
    end

    def get_number_of_planets_closer_than(distance)
      new_planets = @planets.select {|planet| planet.distance_from_sun < distance}
      return new_planets.length
    end

    def get_total_number_of_moons()
      return @planets.reduce(0) {|sum, planet| sum + planet.number_of_moons}
    end

    def get_planet_names_sorted_by_increasing_distance_from_sun
      sorted_planets =  @planets.sort_by {|planet| planet.distance_from_sun}
      return sorted_planets.map {|planet| planet.name}
    end

    def get_planet_names_sorted_by_size_decreasing()
      sorted_planets =  @planets.sort_by {|planet| planet.diameter}
      sorted_planets.reverse!
      return sorted_planets.map {|planet| planet.name}
    end

end
