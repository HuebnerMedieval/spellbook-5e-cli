#This class stores information about the spells available to the user
class Spell
    attr_accessor :school, :class, :name, :description, :range, :duration, :level, :material, :ritual, :concentration, :index

    @@all = []

    def initialize(name, index)
        @name = name
        @index = index
        @@all << self
    end

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

    def self.all
        @@all
    end

    def self.find_spell_by_name(name)
        Spell.all.find{|spell| spell.name.downcase == name.downcase}
    end

    # def self.find_or_create_by_name(name)
    #     spell = self.find_spell_by_name(name)
    #     data = Api.get_spell_data(spell.index)
    #     spell.populate(data["desc"].join(" "), data["range"], data["duration"], data["level"], data["school"]["name"], data["material"], data["ritual"], data["concentration"])
    # end

end