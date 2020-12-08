class Table
    def display_card
        puts "| POKEDEX ##{number}| #{name}  "
        puts "|_____________________"
        puts "|_TYPE:#{type}"
        puts "|_HP: #{HP}    SPEED: #{speed}"
        puts "|_ATTACK: #{attack} SPC. ATTACK #{spc_attack}"
        puts "|_DEFENSE:#{attack} SPC. DEFENSE #{spc_defense}"
        puts "|_HT: #{height}   WT: #{weight}"
        puts "|_____________________"
    end
end