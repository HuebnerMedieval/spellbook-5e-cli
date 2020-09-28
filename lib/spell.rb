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
        add_to_school(school)
        add_to_class(class)
        material ? @material = material : @material = "N/A"
        ritual ? @ritual = ritual : @ritual = "N/A"
        concentration ? @concentration = concentration : @concentration = "N/A"
        @@all << self
    end

    def self.all
        @@all
    end

    def self.create_from_website(hash)
        #takes in data from the API and instantiates a new spell
    end


    def add_to_school(school_name)
        self.school = School.find_or_create(school_name)
        self.school.spells << self
    end

    def add_to_class(class_name)
        self.class = Spellcaster.find_or_create(class_name)
        self.class.spells << self
    end

end