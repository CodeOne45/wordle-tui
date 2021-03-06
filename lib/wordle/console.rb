
module Wordle
  class Console
    def self.print
      new.print
    end

    def print
      puts green_example
      puts yellow_example
      puts gray_example
      puts "\nRestart and add -i flag to target a specific word by hash, for example:"
      puts "$ wordle -i ed541a\n\n"
    end

    private

    def green_example
      "#{"w".green}eary - The letter w is in the word and in the correct spot."
    end

    def yellow_example
      "p#{"i".yellow}lls - The letter i is in the word but in the wrong spot."
    end

    def gray_example
      "vag#{"u".gray}e - The letter u is not in the word in any spot."
    end
  end
end

  