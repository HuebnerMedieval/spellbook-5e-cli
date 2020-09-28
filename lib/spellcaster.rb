#This class stores information about spellcasting classes
class Spellcaster
    attr_accessor :spells
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @spells = []
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find(|spell| spell.name == name)
    end

    def self.find_or_create(name)
        #finds an existing School instance, or creates a new one
        if self.find_by_name(name)
            self.find_by_name(name)
        else 
            self.new(name)
        end
    end

end