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
        puts "To see a list of all spells, type 'spells'."
        puts ""
        puts "For a list of all of the schools of magic, type 'schools'."
        puts ""
        puts "For a list of spellcasting classes, type 'classes'."
        puts ""
        puts "To exit the program, type 'exit'."
        puts ""
        @input = gets.strip.downcase
    end
end