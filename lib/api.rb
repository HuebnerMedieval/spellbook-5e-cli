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
        @@spell_metadata = spells["results"]
    end

    def self.metadata
        @@spell_metadata
    end

end
