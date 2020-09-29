#This is the class which will interface with the user
class Cli
    def menu
        puts ""
        puts "Welcome, new spellcaster."
        puts ""
        puts "*************************"
        puts ""
        puts "This database will help you learn about the spells at your disposal."
        puts "This list is not exhaustive, and covers only the spells in the Player's Handbook"
        puts ""
        puts "*************************"
        puts ""
        @input = "lorum ipsum"
        until @input.downcase == "spells" || @input == "exit"
            puts "To see a list of all spells, type 'spells'."
            puts ""
            puts "To exit the program, type 'exit'."
            puts ""
            Api.import_spells
            binding.pry
            @input = gets.strip.downcase
            if @input == "spells"
                Spell.list_spells
                puts ""
                puts "Thanks for waiting through that."
                puts ""
                puts "Now, What spell do you want to know about?"
                @input = "lorum ipsum"
                #search metadata for the name
                until Api.metadata.has_value?(@input)
                    puts "Type a spell name to learn more about the spell."
                    @input = gets.strip
                    if Api.metadata.has_value?(@input)
                        spell = Spell.find_or_create_by_name(@input)
                        puts "What would you like to know about this spell?"
                        puts "To know what it does, type 'description'."
                        puts "To know its range and duration, type 'casting'."
                        puts "to know its level and if it has any requirements, type 'requirements'."
                        #need to code the next level of search
                    else
                        puts "Please check the spelling of your spell."
                    end
                end
            elsif @input.downcase == "exit"
                exit
            end
        end
    end
end