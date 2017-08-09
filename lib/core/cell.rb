module TicTacToe
  class Cell

    attr_accessor :value

    def initialize(value = "")
      @value = value
    end

    def mark(symbol)
      if free?
        self.value = symbol
        true
      else
        false
      end
    end

    def free?
      value == ""
    end

    def marked?
      !free?
    end
  end
end
