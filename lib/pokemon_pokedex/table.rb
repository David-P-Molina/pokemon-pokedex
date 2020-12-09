class Table
    def display_card
        puts "╚═POKEDEX ##{number}| #{name}  "
        puts "╚═════════════════════════════╗"
        puts "╚═TYPE:#{type}"
        puts "╚═HP: #{HP}    SPEED: #{speed}"
        puts "╚═ATTACK: #{attack} SPC. ATTACK #{spc_attack}"
        puts "╚═DEFENSE:#{attack} SPC. DEFENSE #{spc_defense}"
        puts "╚═HT: #{height}   WT: #{weight}"
        puts "╚═════════════════════════════╗"
    end
end