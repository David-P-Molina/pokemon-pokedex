class Table
    def display_team_member()
        puts "╚═POKEDEX ##{number}| #{name}  "
        puts "╚═════════════════════════════╗"
        puts "╚═TYPE:#{type}"
        puts "╚═HP: #{hp}    SPEED: #{speed}"
        puts "╚═ATTACK: #{attack} SPC. ATTACK #{spc_attack}"
        puts "╚═DEFENSE:#{defense} SPC. DEFENSE #{spc_defense}"
        puts "╚═HT: #{height}   WT: #{weight}"
        puts "╚═════════════════════════════╗"
    end
    def pokedex_display
        puts "╚═POKEDEX ##{number}| #{name}  "
        puts "╚═TYPE:#{type}"
        puts "╚═════════════════════════════════════════════════════════════════════════════════════════════════════════╗"
        puts "#{description}"
        puts "╚═════════════════════════════════════════════════════════════════════════════════════════════════════════╝"
        puts "╚═HP: #{hp}    SPEED: #{speed} ATTACK: #{attack} SPC. ATTACK #{spc_attack}"
        puts "╚═DEFENSE:#{defense} SPC. DEFENSE #{spc_defense} HT: #{height}   WT: #{weight}"
    end
end