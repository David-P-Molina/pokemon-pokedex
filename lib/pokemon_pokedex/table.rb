class Table
    #instantiate a table object and add attr_accessor
    attr_accessor :name, :url, :number, :height, :weight, :type, :hp, :attack, :defense, :spc_attack, :spc_defense, :speed

    def initialize

    end
    def display_team_member #accepts (number, name, type, hp, speed, attack, spc_attack, defense, spc_defense, height, weight)
        puts "╚═POKEDEX ##{pokemon.number}| #{pokemon.name}  "
        puts "╚═════════════════════════════╗"
        puts "╚═TYPE:#{pokemon.type}"
        puts "╚═HP: #{pokemon.hp}    SPEED: #{pokemon.speed}"
        puts "╚═ATTACK: #{pokemon.attack} SPC. ATTACK #{pokemon.spc_attack}"
        puts "╚═DEFENSE:#{pokemon.defense} SPC. DEFENSE #{pokemon.spc_defense}"
        puts "╚═HT: #{pokemon.height}   WT: #{pokemon.weight}"
        puts "╚═════════════════════════════╗"
    end
    #alternate display card
    # def display_team_member #accepts (number, name, type, hp)
    #     puts "╚═POKEDEX ##{number}| #{name}  "
    #     puts "╚═════════════════════════════╗"
    #     puts "╚═TYPE:#{type}   HP: #{hp}"
    #     puts "╚═════════════════════════════╗"
    # end
    def pokedex_display_card#accepts (number, name, type, description, hp, speed, attack, spc_attack, defense, spc_defense, height, weight)
        puts "╚═POKEDEX ##{number}| #{name}  "
        puts "╚═TYPE:#{type}"
        puts "╚═════════════════════════════════════════════════════════════════════════════════════════════════════════╗"
        puts "#{description}"
        puts "╚═════════════════════════════════════════════════════════════════════════════════════════════════════════╝"
        puts "╚═HP: #{hp}    SPEED: #{speed} ATTACK: #{attack} SPC. ATTACK #{spc_attack}"
        puts "╚═DEFENSE:#{defense} SPC. DEFENSE #{spc_defense} HT: #{height}   WT: #{weight}"
    end
end