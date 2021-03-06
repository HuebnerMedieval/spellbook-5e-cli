
class Cli
    def menu
        puts ""
        puts "Welcome, new spellcaster."
        puts ""
        puts "********************"
        puts ""
        puts "This database will help you learn about the spells at your disposal."
        puts "This list is not exhaustive, and covers only the spells in the DnD 5e Basic Rules"
        puts ""
        puts "********************"
        puts ""
        input = "lorum ipsum"
        Api.import_spells
        until input.downcase == "spells" || input.downcase == "exit"
            puts "To see a list of all spells, type 'spells'."
            puts ""
            puts "To exit the program, type 'exit'."
            puts ""
            input = gets.strip
            if input.downcase == "spells"
                self.print_spells
                puts ""
                puts "--------------------"
                puts "Now, What spell do you want to know about?"
                input = "lorum ipsum"
                until Spell.all.find {|spell| spell.name == input}
                    puts ""
                    puts "*-*-*-*-*-*-*-*-*-*"
                    puts "Type a spell name to learn more about it, or type 'exit'."
                    puts "If you need the list of spells again, type 'list spells'."
                    puts "*-*-*-*-*-*-*-*-*-*"
                    input = gets.strip.downcase
                    if Spell.all.find {|spell| spell.name.downcase == input}
                        spell = Api.get_spell(input)
                        puts ""
                        puts "What would you like to know about #{spell.name}?"
                        puts ""
                        self.spell_menu(spell.name)
                        puts ""
                        deeper_input = "lorum ipsum"
                        until deeper_input == "description" || deeper_input == "casting" || deeper_input == "requirements" || deeper_input == "back"
                            deeper_input = gets.strip.downcase
                            if deeper_input == "description"
                                puts "********************"
                                puts spell.description
                                puts "********************"
                                puts ""
                                deeper_input = "lorum ipsum"
                                self.spell_menu(spell.name)
                            elsif deeper_input == "casting"
                                puts "********************"
                                puts "#{spell.name}'s range is #{spell.range}, and it lasts #{spell.duration}."
                                puts "********************"
                                puts ""
                                deeper_input = "lorum ipsum"
                                self.spell_menu(spell.name)
                            elsif deeper_input == "requirements"
                                puts "********************"
                                puts "#{spell.name} is a level #{spell.level} spell."
                                puts "Requirements: #{spell.material}"
                                puts "********************"
                                puts ""
                                deeper_input = "lorum ipsum"
                                self.spell_menu(spell.name)
                            elsif deeper_input == "exit"
                                exit
                            end
                        end
                    elsif input == "exit"
                        exit
                    elsif input == "list spells"
                        self.print_spells
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

    #prints a list of all spells in the Basic Rules by name.
    def print_spells
        Spell.all.each_with_index {|spell, index| puts "#{index + 1}. #{spell.name}"}
    end

    def spell_menu(spell_name)
        puts "*-*-*-*-*-*-*-*-*-*"
        puts "To know what #{spell_name} does, type 'description'."
        puts "To know #{spell_name}'s range and duration, type 'casting'."
        puts "To know #{spell_name}'s level and if it has any requirements, type 'requirements'."
        puts "To pick a new spell, type 'back'."
        puts "To exit the program, type 'exit'."
        puts "*-*-*-*-*-*-*-*-*-*"
    end
end