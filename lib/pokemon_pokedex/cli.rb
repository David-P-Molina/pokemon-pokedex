require "pry"
class CLI
     #include Aesthetic ##module
     attr_reader :name, :pokemons
     attr_accessor :count
     def start
        #API.new.select_stats
        line_top
        poke_logo
        line_bottom
        user_greeting
        line
        user_name
        ready_or_not
    end
    def user_greeting
         puts "                             Hello there!"
         puts "           Welcome to the Kanto Pokedex & Team Builder CLI app!"
         puts "            My name is OAK! People call me the POKEMON PROF! "
         puts "         This world is inhabited by creatures called POKEMON!!"
         puts " For some people POKEMON are pets. Others use them for fights. Here..."
         puts "                 Here we study POKEMON as a profession."
     end
     def user_name
         puts "                      First, what is your name?"
         @name = gets.chomp.upcase
         line
         puts "                   Right! so your name is #{name}!"
         puts "        #{name} Your very own POKEMON legend is about to unfold!"
         puts "        A world of dreams and adventures with POKEMON awaits! Let's go!"
    end
    def ready_or_not
         puts "                 #{name} Are you ready to begin? (yes or no)"
          input = gets.chomp.downcase
          if input == "yes" || input == "y"
          #     all_pokedex_list
               pokedex_list
          elsif input == "no" || input == "n" || input == "exit" || input == "exit!"
               puts "               We are sad to see you go! Please come again soon!"
               exit 
          else
               invalid_input
               ready_or_not
          end
     end
     def pokedex_saved_list
          @pokemons = Pokemon.all
          pokemons.each do |pokemon|
               puts pokemon.number.to_s + ". " + pokemon.name 
          end
          list_options
     end
     def pokedex_list
          @pokemons = API.pokemon_roster #array of pokemonobjects
          pokemons.each do |pokemon|
               puts pokemon.number.to_s + ". " + pokemon.name 
          end
          list_options
     end
     def short_pokedex_list ##finish logic
          @count ||= 0
          pokemons = Pokemon.all #array of pokemonobjects
          pokemons[count..count+39].each do |pokemon|
               puts pokemon.number.to_s + ". " + pokemon.name 
          end
          puts "                       -All- Next-->" if count.between?(0,39)
          puts "           <--Previous -All- Next-->" if count.between?(40,119)
          puts "           <--Previous -All-" if count.between?(120,151)
          short_list_options
     end
     
     def short_list_options
          puts "           To view a Pokemon type their Pokedex number"
          puts "           To navigate type Previous, Next or All"
          input = gets.chomp.downcase
          if (1..151) === input.to_i
               puts " Loading Info..."
               # API.pokemon_description
               # API.select_stats
               pokemon = @pokemons[input.to_i-1]
               API.pokemon_stats(pokemon.url)
               #method that sends number to pokemon class who uses number to call api for info and use info in table class to
               #display here
          elsif input == "all"
               binding.pry
               pokedex_saved_list
          elsif input == "next"
               self.count += 40
               short_pokedex_list
          elsif input == "previous"
               self.count -= 40
               short_pokedex_list
          elsif input.to_i > 151
               puts "Woah it looks like you are looking for a Pokemon that has yet to be discovered!"
               list_options
          elsif input == "exit" || input == "exit!"
               puts "               We are sad to see you go! Please come again soon!"
               exit 
          else
               invalid_input
               short_pokedex_list
          end
     end

      def list_options
          puts "           To view a Pokemon type their Pokedex number"
          puts "             To see a shorter list type short list"
          input = gets.chomp.downcase
          if input == "shortlist" || input == "short list" || input == "shorterlist" || input == "shorter list"|| input == "short" || input == "list" || input == "shorter"
              short_pokedex_list ##Build this method
          elsif (1..151) === input.to_i
               puts " Loading Info..."
               # binding.pry
               pokemon = @pokemons[input.to_i-1]
               API.pokemon_stats(pokemon.url)
               #create display method 
               #method that sends number to pokemon class who uses number to call api for info and use info in table class to
               #display here
          elsif input.to_i > 151
               puts "Woah it looks like you are looking for a Pokemon that has yet to be discovered!"
               list_options
          elsif input == "exit" || input == "exit!"
               puts "               We are sad to see you go! Please come again soon!"
               exit 
          else
               invalid_input
               list_options
          end
      end

     def pokedex_or_team
         puts "  #{name} would you like to search the POKEDEX for a certain POKEMON? "
         puts "      Or are you ready to build a team? please choose (pokemon, team, or exit)"
         path = gets.chomp.downcase
         if path == "pokemon"|| path == "poke mon" || path == "poke'mon" || path == "pokémon" || path == "poké mon" || path == "poké'mon" || path == "pokèmon"|| path == "pokè mon" || path == "pokè'mon" || path == "1"
          pokedex_list
         elsif path == "team" || path == "pokemon team" || path == "pokemon team" || path == "2"
          team_builder
          puts "Lets start "
         elsif path == "or"
          puts "         I see you have a sense of humor. Lets try this again!"
          pokedex_or_team
         elsif path == "exit" || path == "exit!"
          exit
         else
          invalid_input
          pokedex_or_team
         end
    end
    def team_builder
         puts "                    Lets pick your team!"
    end
    def invalid_input
         puts "        You remind me of my grandson... I forget his name."
         puts "     He was always fooling around too! Lets try one more time!"  
     line
    end
    #would you like to add this pokemon to your team?(Yes,No(I'll Keep looking))
    #are you ready to start building your team?
    #Are you sure you want to set your pokemon free?
    #exit method "You are ready to face any obstacle! Now embark on your journey with your pokemon by your side!"
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
     def line
          puts "<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:><:>:<:><:><:"
     end
     def line_top
          puts "╔═════════════════════════════════════════════════════════════════════╗"
     end
     def line_bottom
          puts "╚═════════════════════════════════════════════════════════════════════╝"
     end
end
##tty for columns