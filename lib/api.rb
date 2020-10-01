
class Api

    LIST_URL = "https://www.dnd5eapi.co/api/spells"

    #gets the list of spell names and indices from the API
    def self.get_spell_list
        uri = URI.parse(LIST_URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    #takes an index and finds data on a specific spell from the API
    def self.get_spell_data(index)
        uri = URI.parse("https://www.dnd5eapi.co/api//spells/#{index}")
        response = Net::HTTP.get_response(uri)
        spell_data = JSON.parse(response.body)
        spell_data
    end

    #goes through the list of spells from #Api.get_spell_list and instantiates spell objects
    def self.import_spells
        spells = JSON.parse(self.get_spell_list)
        spells["results"].each do |spell|
            Spell.new(spell["name"], spell["index"])
        end
    end

    #searches through Spell.all for a spell. If the spell exists and is fully populated
    #it retrieves that spell. If not, it populated its attributes from the API
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
end
