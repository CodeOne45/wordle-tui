module Wordle
    class GuessValidator
        attr_reader :error

        def initialize(guess, list)
            @guess = guess
            @list = list
        end
        
        def invalid?
            # check if input word is 5 lenghth
            if @guess.length != 5
                @error = "Guess must be 5 letters long"
                return true
            end
            # If word is in dictionary
            if @list.invalid?(@guess)
                @error = "Guess must be reak word"
                return true
            end

            false
        end

    end
end