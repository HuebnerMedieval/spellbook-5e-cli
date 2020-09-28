#This class stores information about the schools of magic
class School
    @@all = []

    def initialize(name)
        @name = name
        @spells = []
    end
end