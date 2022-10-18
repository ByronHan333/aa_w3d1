require_relative "player"

class ClassName

  attr_reader :current_player

  def initialize
    @fragment = ''
    @dictionary = self.read('files/dictionary.txt').to_s
    @player_1 = Player.new('A')
    @player_2 = Player.new('B')
    @current_player = player_1
    @previous_player = nil
  end

  def read(file_path)
    f = File.read(file_path).split("\n")
  end

  def valid_play?(string)
    @dictionary.any? {|word| word.start_with?(@fragment+string)}
  end

  def next_player!
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
    @previous_player = @current_player == @player_1 ? @player_1 : @player_2
  end

  def take_turn(player)
    while true
      letter = @current_player.guess
      break if valid_play?(letter)
    end
    @fragment += letter
    return @dictionary.include?(@fragment) ? true : false
  end

  def play_round
    result = take_turn(@current_player)
    
  end



end

g = Ghost.new()




f = File.read('files/dictionary.txt')
# p f.is_a?(Array)
# p f.is_a?(String)

# p f[0..20].split("\n")
file_path = 'files/dictionary.txt'
arr = File.read(file_path).split("\n")
d = arr.to_set
p d.any? {|word| word.start_with?('hui')}
