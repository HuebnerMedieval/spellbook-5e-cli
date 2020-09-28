#This class stores information about spellcasting classes
class Spellcaster
    @@all = []

    def initialize(name)
        @name = name
        @spells = []
    end
end