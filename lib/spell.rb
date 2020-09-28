#This class stores information about the spells available to the user
class Spell
    attr_accessor :school, :class
    attr_reader :name, :description, :range, :duration, :level, :material, :ritual, :concentration

    @@all = []

    def initialize(name, description, range, duration, level, school, class, material = nil, ritual = nil, concentration = nil)
        @name = name
        @description = description
        @range = range
        @duration = duration
        @level = level
        #need to check if school exists, add if so, create if not, set school as @school
        #ditto with class
        material ? @material = material : @material = "N/A"
        ritual ? @ritual = ritual : @ritual = "N/A"
        concentration ? @concentration = concentration : @concentration = "N/A"
    end
end