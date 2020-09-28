#This class stores information about spellcasting classes
class Spellcaster
    attr_accessor :spells
    attr_reader :name
    
    @@all = []

    def initialize(name)
        @name = name
        @spells = []
    end

    def self.all
        @@all
    end

    def find_or_create(hash)
        #finds an existing Spellcaster instance, or creates a new one
    end

end