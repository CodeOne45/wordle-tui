module Wordle
    class Game
        def self.play
            new.play
        end

        # Global variables
        def initialize
            @words_list = List.new
            @options = read_options
            # Get a word to guess
            @word_to_guess = generate_word
        end

        def play 

            over = false

            Console.print

            puts "Guess a 5 letter word:"
            guesses = []

            while guesses.length < 6 && !over
                # Get player input
                input_guess = gets.chomp

                guess_valid = GuessValidator.new(input_guess, @words_list)
                if guess_valid.invalid?
                    puts guess_valid.error
                    next
                end 

                analyzer = GuessAnalyzer.new(@word_to_guess, input_guess)
                # print input word with colors
                puts analyzer.colors
                # Add guess world into the guesses list
                guesses << analyzer.squares

                if analyzer.match?
                    over = true
                    break
                end
            end

            puts guesses
        end

        private

        def generate_word
            if @options[:identifier]
                @words_list.by_hash(@options[:identifier])
            else
                @words_list.random
            end
        end

        def read_options
            options = {}
            parser = OptionParser.new do |opts|
              opts.banner = "Usage: wordle [options]"
      
              opts.on("-iIDENTIFIER", "--identifier=IDENTIFIER", "Pass word identifer to target a specific word that someone else has played. Identifier gets printed at the end of the game to share.") do |i|
                options[:identifier] = i
              end
            end
      
            begin
              parser.parse!
            rescue OptionParser::InvalidOption
              puts "Option not recognized"
            end
      
            options
        end
    end
end

