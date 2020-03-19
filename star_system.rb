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
      return @planets.find_all {|planet| planet.number_of_moons == 0}
    end

    def get_planets_with_more_moons(number)
      find_planets = @planets.find_all {|planet| planet.number_of_moons > number}
      return find_planets.map {|planet| planet.name}
    end

    def get_number_of_planets_closer_than(distance)
      return @planets.count { |planet| planet.distance_from_sun < distance }
    end

    def get_total_number_of_moons()
      return @planets.reduce(0) {|sum, planet| sum + planet.number_of_moons}
    end

    def get_planet_names_sorted_by_increasing_distance_from_sun
      sort_planets =  @planets.sort_by {|planet| planet.distance_from_sun}
      return sort_planets.map {|planet| planet.name}
    end

    def get_planet_names_sorted_by_size_decreasing
       sort_planets = @planets.sort { |planet1, planet2| planet2.diameter <=> planet1.diameter }
      return sort_planets.map { |planet| planet.name }
    end

end
