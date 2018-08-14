require_relative 'player'

class Game
  attr_accessor :player1, :player2, :currentPlayer
  def initialize
    @player1 = Player.new("Raf")
    @player2 = Player.new("Taylour")
    @currentPlayer = @player1
  end

  def turn
    while (@player1.hp > 0 && @player2.hp > 0)
      check_current_player
      puts "----- NEW TURN -----"
      question
      puts "#{@player1.name}: #{@player1.hp}/3 vs #{@player2.name}: #{@player2.hp}/3"
    end
    puts "GAME OVER!! #{@currentPlayer.name} WINSSS!"
  end

  def question
    x = rand(1...10)
    y = rand(1...10)
    result = x * y
    puts "What does #{x} * #{y} equals to?"
    check_answer(result)
  end

  def check_answer(result)
    answer = (gets.chomp).to_i
    if answer == result then
      puts "#{@currentPlayer.name}: Correct!!"
    else
      puts "#{@currentPlayer.name}: Nopeee!"
      @currentPlayer.loose_hp
    end
  end

  def check_current_player
    if @currentPlayer == @player1
      @currentPlayer = @player2
    else
      @currentPlayer = @player1
    end
  end

end