#This class stores information about the spells available to the user
class Spell
    attr_accessor :school, :class, :name, :description, :range, :duration, :level, :material, :ritual, :concentration

    @@all = []

    def initialize(name, description, range, duration, level, school, spellcaster, material = nil, ritual = nil, concentration = nil)
        @name = name
        @description = description
        @range = range
        @duration = duration
        @level = level
        @school = school
        @spellcaster = spellcaster
        material ? @material = material : @material = "N/A"
        ritual ? @ritual = ritual : @ritual = "N/A"
        concentration ? @concentration = concentration : @concentration = "N/A"
        @@all << self
    end

    def self.all
        @@all
    end

    def add_to_school(school_name)
        self.school = School.find_or_create(school_name)
        self.school.spells << self
    end

    def add_to_spellcaster(class_name)
        self.class = Spellcaster.find_or_create(class_name)
        self.class.spells << self
    end

    def self.find_spell_by_name(name)
        Spell.all.find{|spell| spell.name.downcase == name.downcase}
    end

end