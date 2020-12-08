require "pry"
class CLI
     include Aesthetics
    def start
        line_top
        poke_logo
        line_bottom
        user_greeting
        line
        user_name
        ready_or_not
    end
    def user_greeting
         puts " "
         puts "                             Hello there!"
         puts "           Welcome to the Kanto Pokedex & Team Builder CLI app!"
         puts "            My name is OAK! People call me the POKEMON PROF! "
         puts "         This world is inhabited by creatures called POKEMON!!"
         puts " For some people POKEMON are pets. Others use them for fights. Here..."
         puts "                 Here we study POKEMON as a profession."
         puts " "
    end
    def user_name
         puts " "
         puts "                      First, what is your name?"
         @@name = gets.chomp.upcase
         line
         puts "                   Right! so your name is #{@@name}!"
         puts "        #{@@name} Your very own POKEMON legend is about to unfold!"
         puts "        A world of dreams and adventures with POKEMON awaits! Let's go!"
    end
    def ready_or_not
         puts "                 #{@@name} Are you ready to begin? (yes or no)"
          input = gets.chomp.downcase
          if input == "yes"
               choice
          elsif input == "no"
               puts "               We are sad to see you go! Please come again soon!"
               exit 
          else
               invalid_input
               ready_or_not
          end
    end
     def choice
         puts "  #{@@name} would you like to search the POKEDEX for a certain POKEMON? "
         puts "      Or are you ready to build a team?please type (pokemon or team)"
         path = gets.chomp.downcase
         if path == "pokemon"#|| "poke mon" || "poke'mon" || "pokémon" || "poké mon" || "poké'mon" || "pokèmon"|| "pokè mon" || "pokè'mon" || "1"
          pokedex_search
         elsif path == "team"# || "pokemon team" || "pokemon team" || "2"
          team_builder
          puts 
         elsif path == "or"
          puts "         I see you have a sense of humor. Lets try this again!"
          choice
         else
          invalid_input
          choice
         end
    end
    def pokedex_search
         puts "               Alright, Lets learn about POKEMON"
    end
    def team_builder
     puts "Lets pick your team!"
    end
    def invalid_input
         puts "         You remind me of my grandson... I forget his name."
         puts "     He was always fooling around too! Lets try one more time!"  
     line
    end
    def menu
         puts "Please pick a number from 1-151 or if you are feeling lucky type random!"
    end
         #
    #What pokemon would you like to learn about
    #would you like to add this pokemon to your team?(Yes,No(I'll Keep looking))
    #are you ready to start building your team?
    #Are you sure you want to set your pokemon free?
    #exit method "You are ready to face any obstacle! Now embark on your journey with your pokemon by your side!"
end
CLI.new.start