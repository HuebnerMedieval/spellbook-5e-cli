
class Spell
    attr_accessor :school, :class, :name, :description, :range, :duration, :level, :material, :ritual, :concentration, :index

    @@all = []

    #takes the name and index of a spell to instantiate an object
    def initialize(name, index)
        @name = name
        @index = index
        @@all << self
    end

    #fills in all of the attributes for a specific spell
    def populate (description, range, duration, level, school, material = nil, ritual = nil, concentration = nil)
        @description = description
        @range = range
        @duration = duration
        @level = level
        @school = school
        material ? @material = material : @material = "N/A"
        ritual ? @ritual = ritual : @ritual = "N/A"
        concentration ? @concentration = concentration : @concentration = "N/A"
        @@all << self
    end

    #lists all spell objects
    def self.all
        @@all
    end

    #finds a particular spell by name
    def self.find_spell_by_name(name)
        Spell.all.find{|spell| spell.name.downcase == name.downcase}
    end

end