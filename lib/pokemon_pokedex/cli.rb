require "pry"
class CLI
     attr_reader :name, :pokemons, :pokemon
     attr_accessor :count
     def start
        poke_logo
        user_greeting
        line
        user_name
        ready_or_not
    end
    def poke_logo #Source https://ascii.co.uk/art/pokemon
         puts "╔══════════════════════════════════════════════════════════════════════╗"
         puts "║                                        .::.                          ║"
         puts "║                                      .;:**'                          ║"           
         puts "║                             .                                        ║"
         puts "║      .:XHHHHk.              db.   .;;.     dH  MX                    ║"
         puts "║    oMMMMMMMMMMM       ~MM  dMMP :MMMMMR   MMM  MR      ~MRMN         ║"
         puts "║   'QMMMMMb  'MMX       MMMMMMP !MX' :M~   MMM MMM  .oo. XMMM 'MMM    ║" 
         puts "║      `MMMM.  )M> :X!Hk. MMMM   XMM.o'  .  MMMMMMM X?XMMM MMM>!MMP    ║"
         puts "║       'MMMb.dM! XM M'?M MMMMMX.`MMMMMMMM~ MM MMM XM `''MX MMXXMM     ║"
         puts "║        ~MMMMM~ XMM. .XM XM`'MMMb.~*?**~ .MMX M t MMbooMM XMMMMMP     ║" 
         puts "║         ?MMM>  YMMMMMM! MM   `?MMRb.    `'''   !L'MMMMM XM IMMM      ║"
         puts "║          MMMX   'MMMM'  MM       ~%:           !Mh.''' dMI IMMP      ║"
         puts "║          'MMM.         The Original 151 Pokemon            IMX       ║"
         puts "║           ~M!M         ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀            IMP    ©  ║"
         puts "╚══════════════════════════════════════════════════════════════════════╝"
    end
    def line
         puts "<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:>:<:><:>:<:><:><:"
    end
    def user_greeting
         puts "                             Hello there!"
         puts "                       Welcome to the KANTO POKEDEX"
         #puts "    & team builder! Yes you can pick up to 6 pokemon to help you on your journey!"
         puts "            My name is OAK! People call me the POKEMON PROF! "
         puts "         This world is inhabited by creatures called POKEMON!!"
         puts "   For some people POKEMON are pets. Others use them for fights. Here..."
         puts "                   Here we study POKEMON as a profession."
     end
     def user_name
         puts "                       First, what is your name?"
         @name = gets.chomp.upcase
         line
         puts "                     Right! so your name is #{name}!"
         puts "         #{name} Your very own POKEMON legend is about to unfold!"
         puts "       A world of dreams and adventures with POKEMON awaits! Let's go!"
    end
    def ready_or_not
         puts "                 #{name} Are you ready to begin? (yes or no)"
          input = gets.chomp.downcase
          if input == "yes" || input == "y"
               retrieve_roster
               pokedex_list
          elsif input == "no" || input == "n" || input == "exit" || input == "exit!"
               leaving
          else
               invalid_input
               ready_or_not
          end
     end
     #retrievers
     def retrieve_roster
          @pokemons = API.pokemon_roster
          @pokemons
     end
     def retrieve_pokemon_info(input)
          puts " Loading Info..."
          @pokemon = @pokemons[input.to_i-1]
          stats = API.pokemon_stats(pokemon.url)
          description = API.pokemon_description(pokemon.number)
          pokemon
     end
     def retrieve_pokemon_and_display(input)
          pokemon = retrieve_pokemon_info(input)
          pokedex_display_card(pokemon)
          pokemon_display_options
     end
     #pokedex lists
     def pokedex_list
          @pokemons = Pokemon.all
          pokemons.each do |pokemon|
               puts pokemon.number.to_s + ". " + pokemon.name 
          end
          list_options
     end
     def short_pokedex_list 
          @count ||= 0
          pokemons = Pokemon.all 
          pokemons[count..count+39].each do |pokemon|
               puts pokemon.number.to_s + ". " + pokemon.name 
          end
          short_list_options
     end
     #Input Options
     def list_options
          puts "            To view a Pokemon type their Pokedex number"
          puts "                To see a shorter list type short list"
          input = gets.chomp.downcase
          if input == "shortlist" || input == "short list" || input == "shorterlist" || input == "shorter list"|| input == "short" || input == "list" || input == "shorter"
               short_pokedex_list 
          else
               general_inputs(input)
          end
     end
     def short_list_options
          puts "                                -All- Next-->" if count.between?(0,39)
          puts "                    <--Previous -All- Next-->" if count.between?(40,119)
          puts "                    <--Previous -All-" if count.between?(120,151)
          puts "              To view a Pokemon type their Pokedex number"
          puts "                To navigate type Previous, Next or All"
          input = gets.chomp.downcase
          if input == "next" && self.count < 119 
               self.count += 40 
               short_pokedex_list
          elsif input == "previous" && self.count > 39
               self.count -= 40
               short_pokedex_list
          elsif input == "all"
               pokedex_list
          else
               general_inputs(input)
          end
     end
     def general_inputs(input)
          input
          if (1..151) === input.to_i
               retrieve_pokemon_and_display(input)
          elsif input.to_i > 151
               future_pokemon
          elsif input == "exit" || input == "exit!"
               leaving
          else
               invalid_input
               list_options
           end
     end
     def pokemon_display_options
          #puts "         If you would like to add this pokemon to your team type add"
          puts "             To look at other pokemon type all or shorterlist"
          input = gets.chomp.downcase
          if input == "shortlist" || input == "short list" || input == "shorterlist" || input == "shorter list"|| input == "short" || input == "list" || input == "shorter"
               short_pokedex_list 
          #elsif input == "add" || input == "+" || input == "add pokemon" || input == "yes" 

          else
               general_inputs(input)
          end
     end
     #additional messages
      def future_pokemon
          puts "               Woah it looks like you are looking!"
          puts "           for a Pokemon that has yet to be discovered!"
          line
          list_options
      end
      def leaving
          puts "            We are sad to see you go! Please come again soon!"
          line
          exit 
      end
      def invalid_input
          puts "           You remind me of my grandson... I forget his name."
          puts "         He was always fooling around too! Lets try one more time!"  
          line
     end
     #display options
     def pokedex_display_card(pokemon)#accepts (number, name, type, description, hp, speed, attack, spc_attack, defense, spc_defense, height, weight)
          puts "  ╚═POKEDEX ##{pokemon.number}| #{pokemon.name}  "
          puts "  ╚═TYPE:#{pokemon.type}"
          puts "  ╚═════════════════════════════════════════════════════════════════════════════════════════════════════════╗"
          puts "  #{pokemon.description}."
          puts "  ╚═════════════════════════════════════════════════════════════════════════════════════════════════════════╝"
          puts "  ╚═>HP: #{pokemon.hp}    SPEED: #{pokemon.speed} ATTACK: #{pokemon.attack} SPC. ATTACK #{pokemon.spc_attack}"
          puts "  ╚═>DEFENSE:#{pokemon.defense} SPC. DEFENSE #{pokemon.spc_defense} HT: #{pokemon.height}   WT: #{pokemon.weight}"
     end
end
##tty for columns
#      def pokedex_or_team
#          puts "  #{name} would you like to search the POKEDEX for a certain POKEMON? "
#          puts "      Or are you ready to build a team? please choose (pokemon, team, or exit)"
#          path = gets.chomp.downcase
#          if path == "pokemon"|| path == "poke mon" || path == "poke'mon" || path == "pokémon" || path == "poké mon" || path == "poké'mon" || path == "pokèmon"|| path == "pokè mon" || path == "pokè'mon" || path == "1"
#           pokedex_list
#          elsif path == "team" || path == "pokemon team" || path == "pokemon team" || path == "2"
#           team_builder
#           puts "Lets start "
#          elsif path == "or"
#           puts "         I see you have a sense of humor. Lets try this again!"
#           pokedex_or_team
#          elsif path == "exit" || path == "exit!"
#           exit
#          else
#           invalid_input
#           pokedex_or_team
#          end
#     end
#     def team_builder
#          puts "                    Lets pick your team!"
#     end
#would you like to add this pokemon to your team?(Yes,No(I'll Keep looking))
#are you ready to start building your team?
#Are you sure you want to set your pokemon free?
#exit method "You are ready to face any obstacle! Now embark on your journey with your pokemon by your side!"