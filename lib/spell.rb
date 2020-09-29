#This class stores information about the spells available to the user
class Spell
    attr_accessor :school, :class, :name, :description, :range, :duration, :level, :material, :ritual, :concentration

    @@all = []

    def initialize(name, description, range, duration, level, school, material = nil, ritual = nil, concentration = nil)
        @name = name
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

    def self.find_or_create_by_name(name)
        if self.find_spell_by_name(name)
            self.find_spell_by_name(name)
        else
            spell = Api.metadata.find {|spell| spell["name"] == name}
            data = Api.get_spell_data(spell["index"])
            new_spell = Spell.new(data["name"], data["desc"].join(" "), data["range"], data["duration"], data["level"], data["school"]["name"], data["material"], data["ritual"], data["concentration"])
            new_spell
        end
    end

    def self.list_spells
        Api.metadata.each_with_index do |spell, index|
            data = Api.get_spell_data(spell["index"])
            puts "#{index + 1}. #{data["name"]}"
        end
    end

end