class CLI
     attr_reader :name, :pokemons, :pokemon, :teams, :pokemon_log
     attr_accessor :count
     def start
        poke_logo
        create_variables
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
         puts "             Welcome to the KANTO POKEDEX & Team Builder!"
         puts "       Yes you can pick up to 6 pokemon to help you on your journey!"
         puts "            My name is OAK! People call me the POKEMON PROF! "
         puts "         This world is inhabited by creatures called POKEMON!!"
         puts "   For some people POKEMON are pets. Others use them for fights. Here..."
         puts "                   Here we study POKEMON as a profession."
         retrieve_roster
     end
     def create_variables
          @team = Team.new
          @pokemon_log = []
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
         puts "                 #{name} Are you ready to begin? [yes or no]"
          input = gets.chomp.downcase
          if input == "yes" || input == "y" || input == "[yes]" || input == "[y]"
               pokedex_list
          elsif input == "no" || input == "n" || input == "exit" || input == "exit!"|| input == "[no]" || input == "[n]"
               leaving
          else
               invalid_input
               ready_or_not
          end
     end
     #retrievers
     def retrieve_roster
          @pokemons = API.pokemon_roster
 #         @pokemons
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
     def retrieve_team_names
          team = Team.all.first
          team_names = team.pokemons.collect {|pokemon| pokemon.name.capitalize}
          team_names
     end
     #pokedex lists
     def pokedex_list
          @pokemons = Pokemon.all
          pokemons.each do |pokemon|
               puts pokemon.number.to_s + ". " + pokemon.name.capitalize  
          end
          list_options
     end
     def short_pokedex_list 
          @count ||= 0
          #pokemons = Pokemon.all 
          pokemons[count..count+39].each do |pokemon|
               puts pokemon.number.to_s + ". " + pokemon.name.capitalize 
          end
          short_list_options
     end
     def team_list
          team = Team.all.first
               team.pokemons.each do |pokemon|
                   display_team_member(pokemon)
               end
          team_comment
          line
          team_display_options
     end
     #Input Options
     def list_options
          puts "              To view a POKEMON type their POKEDEX number"
          puts "                 To see a shorter list type [short]"
          puts "                   To view your team type [team]"
          input = gets.chomp.downcase
          if input == "[short]" || input == "short list" || input == "shorterlist" || input == "shorter list"|| input == "short" || input == "list" || input == "shorter"
               short_pokedex_list 
          else
               general_inputs(input)
          end
     end
     def short_list_options
          puts "                               -All- Next-->" if count.between?(0,39)
          puts "                   <--Previous -All- Next-->" if count.between?(40,119)
          puts "                   <--Previous -All-" if count.between?(120,151)
          puts "             To view a POKEMON type their POKEDEX number"
          puts "                  To view your team type [team]"
          puts "                To navigate [previous, next or all]"
          input = gets.chomp.downcase
          if input == "next" && self.count < 119 
               self.count += 40 
               short_pokedex_list
          elsif input == "previous" && self.count > 39 
               self.count -= 40
               short_pokedex_list
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
          elsif input == "exit" || input == "exit!"|| input == "[exit]"
               leaving
          elsif input == "pokedex" || input == "poke dex" || input == "all"
               pokedex_list
          elsif input == "roster" || input == "team" || input == "[team]" 
               team_list
          elsif input == "[short]" || input == "short list" || input == "shorterlist" || input == "shorter list"|| input == "short" || input == "list" || input == "shorter"|| input == "[shorterlist]"
               short_pokedex_list 
          else
               invalid_input
               list_options
           end
     end   

     def team_limiter_and_adder
         team = Team.all.first.pokemons.length
         if team == 6
               puts "           It looks like you already have 6 POKEMON"
               puts "          POKEMON info has been added to the POKEDEX"
               puts "          This POKEMON has been transferred to Box 1"
               line
               team_display_options
         else 
               pokemon.team = Team.all.first
               pokemon_log << pokemon

               puts "          POKEMON info has been added to the POKEDEX"
               puts "           #{name} This pokemon has been added to your team"
               line
               puts " Current Team:"
               team_list
               pokemon_display_options
         end
     end
     def pokemon_display_options
          puts "              To add this POKEMON to your team type [add]"
          puts "                   To view your team type [team]"
          puts "             To look at other POKEMON type [all] or [shorterlist]"
          input = gets.chomp.downcase
          if input == "add" || input == "+" || input == "[add]" || input == "yes" 
               team_limiter_and_adder
          else
               general_inputs(input)
          end
     end
     def team_display_options
          puts "               Need to reset your entire team? Type [clear]"
          puts "              Or to remove last pokemon added type [remove]"
          puts "           To look at other POKEMON type [all] or [shortlist]"
          puts "                    To start your journey type exit. "
          input = gets.chomp.downcase
          if input == "clear" || input == "remove all" || input == "remove all pokemon" || input == "[clear]"
               Team.all.first.pokemons.each {|poke| poke.team = nil}
               team_comment
          elsif input == "last" || input == "remove" || input == "undo" || input == "[remove]"
               # pokemon = Team.all.first.pokemons.detect {|poke| poke.number == }
                #pokemon.team = nil
                pokemon_log.last.team = nil
                pokemon_log.pop
               puts "         You have removed a POKEMON from your team. "
               team_list
          else
               general_inputs(input)
          end
          general_inputs
     end
     #additional messages
      def future_pokemon
          puts "               Woah it looks like you are looking!"
          puts "           for a Pokemon that has yet to be discovered!"
          line
          list_options
      end
      def leaving
          if Team.all.first.pokemons.length > 0
               retrieve_team_names
               puts"               #{name}, You are ready to face any obstacle! "
               puts"      Now embark on your journey with your Pokemon by your side!"
               puts"   Presenting your Dream Team!═══>    #{retrieve_team_names.join("  ")}"
               exit 
          else
               puts "            We are sad to see you go! Please come again soon!"
               line
               exit 
          end
      end
      def invalid_input
          puts "           You remind me of my grandson... I forget his name."
          puts "         He was always fooling around too! Lets try one more time!"  
          line
     end
     def team_comment
         team = Team.all.first.pokemons.length
         if team == 0
               puts "            It looks like you have no POKEMON on your team!"
               puts "              View a POKEMON to add it to your roster!"
               ready_or_not
         elsif team.between?(1,5)
               empty = 6 - team
               puts "               You need #{empty} POKEMON to complete your team!"
               team_display_options
         elsif team == 6
               puts "                       All your spots are filled! "
               puts ""
               team_display_options
          else
               general_inputs
          end
     end
     #display options
     def pokedex_display_card(pokemon)
          puts ""
          puts "  ╚═POKEDEX ##{pokemon.number}| #{pokemon.name.capitalize}  "
          puts "  ╚═TYPE:#{pokemon.type.capitalize}"
          puts "  ╚═════════════════════════════════════════════════════════════════════════════════════════════════════════>"
          puts "    DESCRIPTION:  #{pokemon.description}."
          puts "  ╚═════════════"
          puts "  ╚═>HP: #{pokemon.hp}  SPEED: #{pokemon.speed}  ATTACK: #{pokemon.attack}  SPC. ATTACK #{pokemon.spc_attack}"
          puts "  ╚═>DEFENSE:#{pokemon.defense}  SPC. DEFENSE #{pokemon.spc_defense}  HT: #{pokemon.height}   WT: #{pokemon.weight}"
          puts " "
     end
     def display_team_member(pokemon)
        puts ""
        puts " ╚═># #{pokemon.number}| #{pokemon.name.capitalize}"
        puts "   HT: #{pokemon.height}   WT: #{pokemon.weight}"
        puts " ╚═════════════════════════════╗"
        puts " ╚═>TYPE:#{pokemon.type.capitalize}|"
        puts " ╚═════════════════════════════╗"
        puts "  SPD: #{pokemon.speed}| ATK: #{pokemon.attack}| SPC. ATK #{pokemon.spc_attack}|"
        puts "  DEF: #{pokemon.defense}| SPC. DEF #{pokemon.spc_defense}| HP: #{pokemon.hp}"
        line
    end
end
##tty for columns
