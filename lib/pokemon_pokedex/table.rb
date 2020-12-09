class Table
    def display_team_member #accepts (number, name, type, hp, speed, attack, spc_attack, defense, spc_defense, height, weight)
        puts "╚═POKEDEX ##{number}| #{name}  "
        puts "╚═════════════════════════════╗"
        puts "╚═TYPE:#{type}"
        puts "╚═HP: #{hp}    SPEED: #{speed}"
        puts "╚═ATTACK: #{attack} SPC. ATTACK #{spc_attack}"
        puts "╚═DEFENSE:#{defense} SPC. DEFENSE #{spc_defense}"
        puts "╚═HT: #{height}   WT: #{weight}"
        puts "╚═════════════════════════════╗"
    end
    def pokedex_display#accepts (number, name, type, description, hp, speed, attack, spc_attack, defense, spc_defense, height, weight)
        puts "╚═POKEDEX ##{number}| #{name}  "
        puts "╚═TYPE:#{type}"
        puts "╚═════════════════════════════════════════════════════════════════════════════════════════════════════════╗"
        puts "#{description}"
        puts "╚═════════════════════════════════════════════════════════════════════════════════════════════════════════╝"
        puts "╚═HP: #{hp}    SPEED: #{speed} ATTACK: #{attack} SPC. ATTACK #{spc_attack}"
        puts "╚═DEFENSE:#{defense} SPC. DEFENSE #{spc_defense} HT: #{height}   WT: #{weight}"
    end
end