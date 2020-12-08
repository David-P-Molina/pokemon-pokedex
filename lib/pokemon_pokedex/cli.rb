require "pry"
class CLI
    def start
        line_top
        poke_logo
        line_bottom
        user_greeting
        line_a
        user_name
        ready_or_not
    end
    def poke_logo #Source https://ascii.co.uk/art/pokemon
         puts "                                       .::."
         puts "                                     .;:**' "           
         puts "                            .                  "
         puts "     .:XHHHHk.              db.   .;;.     dH  MX   "
         puts "   oMMMMMMMMMMM       ~MM  dMMP :MMMMMR   MMM  MR      ~MRMN"
         puts "  'QMMMMMb  'MMX       MMMMMMP !MX' :M~   MMM MMM  .oo. XMMM 'MMM"
         puts "     `MMMM.  )M> :X!Hk. MMMM   XMM.o'  .  MMMMMMM X?XMMM MMM>!MMP"
         puts "      'MMMb.dM! XM M'?M MMMMMX.`MMMMMMMM~ MM MMM XM `''MX MMXXMM"
         puts "       ~MMMMM~ XMM. .XM XM`'MMMb.~*?**~ .MMX M t MMbooMM XMMMMMP"
         puts "        ?MMM>  YMMMMMM! MM   `?MMRb.    `'''   !L'MMMMM XM IMMM"
         puts "         MMMX   'MMMM'  MM       ~%:           !Mh.''' dMI IMMP"
         puts "         'MMM.                                             IMX"
         puts "          ~M!M         The Original 151 Pokemon            IMP"
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
         line_a
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
               puts "We are sad to see you go!"
               exit 
          else
               puts "     You remind me of my grandson... I forget his name. He was always fooling around too!"
               invalid_input
             
    end
     def choice
         puts "  #{@@name} would you like to search the POKEDEX for a certain POKEMON? Or are you ready to build a team?"
         puts " please type (pokemon or team)"
         path = gets.chomp.downcase
         if path == "pokemon"|| "poke mon" || "poke'mon" || "pokémon" || "poké mon" || "poké'mon" || "pokèmon"|| "pokè mon" || "pokè'mon" || "1"
          pokedex_search
         elsif path == "team" || "pokemon team" || "pokemon team" || "2"
          team_builder
          puts 
         elsif path == "or"
          puts "I see you have a sense of humor. Lets try this again!"
          choice
         else
          puts 
         end
    end
    def pokedex_search
     puts "Lets learn about POKEMON"
    end
    def team_builder
     puts "Lets pick your team!"
    end
    def invalid_input
     puts " "
     puts "               That was not a valid input please try again!"  
     line
    end
    def line
         puts "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
    end
    def line_a
         puts "<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:><:>:<:><:><:"
    end
    def line_top
         puts "╔═════════════════════════════════════════════════════════════════════╗"
    end
    def line_bottom
         puts "╚═════════════════════════════════════════════════════════════════════╝"
    end
    def menu
     "Are you interested in learning about a specific pokemon?"
     ""
    end
         #
    #What pokemon would you like to learn about
    #would you like to add this pokemon to your team?(Yes,No(I'll Keep looking))
    #are you ready to start building your team?
    #Are you sure you want to set your pokemon free?
    #exit method "You are ready to face any obstacle! Now embark on your journey with your pokemon by your side!"
end
CLI.new.start