class Player
  def initialize(name)
    @name = name
  end

  def guess
    while true
      puts "Player #{@name}, Guess a leter from a to z:"
      u_input = gets.chomp
      break if self.valid_guess?(u_input)
    end
    u_input
  end

  def valid_guess?(g)
    alphabet = ('a'..'z').to_a
    alphabet.include?(g)
  end
end


# p = Player.new('h')
# p.get_input
