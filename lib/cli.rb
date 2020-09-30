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
        input = "lorum ipsum"
        until input.downcase == "spells" || input == "exit"
            puts "To see a list of all spells, type 'spells'."
            puts ""
            puts "To exit the program, type 'exit'."
            puts ""
            Api.import_spells
            input = gets.strip.downcase
            if input == "spells"
                Spell.all.each_with_index {|spell, index| puts "#{index + 1}. #{spell.name}"}
                puts ""
                puts "Now, What spell do you want to know about?"
                input = "lorum ipsum"
                #search Spell.all for the spell
                until Spell.all.find {|spell| spell.name == input}
                    puts "Type a spell name to learn more about the spell."
                    input = gets.strip.downcase
                    if Spell.all.find {|spell| spell.name.downcase == input}
                        spell = Api.get_spell(input)
                        puts "What would you like to know about #{spell.name}?"
                        puts "To know what #{spell.name} does, type 'description'."
                        puts "To know #{spell.name}'s range and duration, type 'casting'."
                        puts "to know #{spell.name}'s level and if it has any requirements, type 'requirements'."
                        puts "to search for a different spell, type 'back'."
                        deeper_input = "lorum ipsum"
                        until deeper_input == "description" || deeper_input == "casting" || deeper_input == "requirements" || deeper_input == "back"
                            deeper_input = gets.strip.downcase
                            if deeper_input == "desription"
                                puts spell.description
                            elsif deeper_input == "casting"
                                puts "#{spell.name}'s range is #{spell.range}, and it lasts #{spell.duration}."
                            elsif deeper_input == "requirements"
                                puts "#{spell.name} is #{spell.level} level"
                                puts "Requirements: #{spell.requirements}"
                            end
                        end
                    else
                        puts "Please check the spelling of your spell."
                    end
                end
            elsif @input.downcase == "exit"
                exit
            end
        end
    end

    # def self.list_spells
    #     Spell.all.each_with_index {|spell, index| puts "#{index + 1}. #{spell.name}"}
    # end

end