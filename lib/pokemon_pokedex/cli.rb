require "pry"
class CLI
    def start
        line_top
        logo
        line_bottom
        user_greeting
        line_a
    end
    def poke_logo #Source https://ascii.co.uk/art/pokemon
         puts "                                       .::."
         puts "                                     .;:**' "           
         puts "                            `                  "
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
         puts "           Welcome to the Pokedex & Team Builder CLI app!"
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
         #
    #What pokemon would you like to learn about
    #would you like to add this pokemon to your team?(Yes,No(I'll Keep looking))
    #are you ready to start building your team?
    #Are you sure you want to set your pokemon free?
    #exit method "You are ready to face any obstacle! Now embark on your journey with your pokemon by your side!"
end