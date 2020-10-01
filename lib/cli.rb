#This is the class which will interface with the user
class Cli
    def menu
        puts ""
        puts "Welcome, new spellcaster."
        puts ""
        puts "*************************"
        puts ""
        puts "This database will help you learn about the spells at your disposal."
        puts "This list is not exhaustive, and covers only the spells in the DnD 5e Basic Rules"
        puts ""
        puts "*************************"
        puts ""
        input = "lorum ipsum"
        until input.downcase == "spells" || input.downcase == "exit"
            puts "To see a list of all spells, type 'spells'."
            puts ""
            puts "To exit the program, type 'exit'."
            puts ""
            Api.import_spells
            input = gets.strip
            if input == "spells"
                Spell.all.each_with_index {|spell, index| puts "#{index + 1}. #{spell.name}"}
                puts ""
                puts "Now, What spell do you want to know about?"
                input = "lorum ipsum"
                until Spell.all.find {|spell| spell.name == input}
                    puts ""
                    puts "Type a spell name to learn more about the spell, or type 'exit'."
                    puts "If you need the list of spells again, type 'list spells'."
                    input = gets.strip.downcase
                    if Spell.all.find {|spell| spell.name.downcase == input}
                        spell = Api.get_spell(input)
                        puts ""
                        puts "What would you like to know about #{spell.name}?"
                        puts "******************************"
                        puts "To know what #{spell.name} does, type 'description'."
                        puts "To know #{spell.name}'s range and duration, type 'casting'."
                        puts "To know #{spell.name}'s level and if it has any requirements, type 'requirements'."
                        puts "To pick a new spell, type 'back'."
                        puts "To exit the program, type 'exit'."
                        deeper_input = "lorum ipsum"
                        until deeper_input == "description" || deeper_input == "casting" || deeper_input == "requirements" || deeper_input == "back"
                            deeper_input = gets.strip.downcase
                            if deeper_input == "description"
                                puts "*******************"
                                puts spell.description
                            elsif deeper_input == "casting"
                                puts "*******************"
                                puts "#{spell.name}'s range is #{spell.range}, and it lasts #{spell.duration}."
                            elsif deeper_input == "requirements"
                                puts "*******************"
                                puts "#{spell.name} is a level #{spell.level} spell."
                                puts "Requirements: #{spell.material}"
                            elsif deeper_input == "exit"
                                exit
                            end
                        end
                    elsif input == "exit"
                        exit
                    elsif input == "list spells"
                        Spell.all.each_with_index {|spell, index| puts "#{index + 1}. #{spell.name}"}
                    else
                        puts ""
                        puts "Please check the spelling of your spell."
                    end
                end
            elsif @input == "exit"
                exit
            end
        end
    end

end