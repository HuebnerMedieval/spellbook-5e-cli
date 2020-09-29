#This is the class which will retrieve data from my external webpage.
require 'net/http'
require 'open-uri'
require 'json'

class Api

    LIST_URL = "https://www.dnd5eapi.co/api/spells"

    def get_spell_list
        uri = URI.parse(LIST_URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def get_spell_data(index)
        uri = URI.parse("https://www.dnd5eapi.co/api//spells/#{index}")
        response = Net::HTTP.get_response(uri)
        spell_data = JSON.parse(response.body)
        spell_data
    end

    def import_spells
        spells = JSON.parse(self.get_spell_list)
        spells["results"].each do |spell|
            data = get_spell_data(spell["index"])
            Spell.new(data["name"])
        end
    end
end

spell = Api.new.get_spell_data("arcane-eye")
puts spell