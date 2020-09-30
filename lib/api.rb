#This is the class which will retrieve data from my external webpage.
# require 'net/http'
# require 'open-uri'
# require 'json'

class Api

    LIST_URL = "https://www.dnd5eapi.co/api/spells"

    def self.get_spell_list
        uri = URI.parse(LIST_URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def self.get_spell_data(index)
        uri = URI.parse("https://www.dnd5eapi.co/api//spells/#{index}")
        response = Net::HTTP.get_response(uri)
        spell_data = JSON.parse(response.body)
        spell_data
    end

    def self.import_spells
        spells = JSON.parse(self.get_spell_list)
        spells["results"].each do |spell|
            Spell.new(spell["name"], spell["index"])
        end
    end

    def self.get_spell(name)
        spell = Spell.find_spell_by_name(name)
        if spell.description
            spell
        else
            data = Api.get_spell_data(spell.index)
            spell.populate(data["desc"].join(" "), data["range"], data["duration"], data["level"], data["school"]["name"], data["material"], data["ritual"], data["concentration"])
            spell
        end
    end

#get spell(spell object), which searches to see if the called spell already has data, and if not grabs that data from the json and adds it to the object.
end
