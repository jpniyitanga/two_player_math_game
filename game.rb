class Game
  attr_accessor :turn, :player1, :player2
  
  def initialize
    @turn = 1 
    @player1 = Player.new("Player_1")
    @player2 = Player.new("Player_2")
  end

  #Logic to end the game
  def finish_game 
    if @player1.lives > 0
      winner = @player1 
    else 
      winner = @player2 
    end
    #puts "#{player1}/3 lives. #{player2}/3 lives"
    puts "#{winner.name} wins with a secore of #{winner.lives}"
    puts "-----GAME OVER-----"
    puts "Goodbye!"
    exit(0)
  end

  #Updates player's lives and terminates the game if one of the players has 0 lives
  def update_lives(turn) 
    if turn == 1
      @player1.lives -= 1
    else 
      puts "------ NEW TURN ------"
      @player2.lives -= 1
    end
    
    if @player1.lives == 0 || @player2.lives == 0
      finish_game
    end 
  end

  def update_turn(turn)
    if turn == 1
      @turn = 2
    else
      @turn = 1
    end
    start_game
  end


  #Logic to start the game
  def start_game 
    puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
    question = Question.new(turn)

    if !question.start 
      update_lives(turn)
    end
    update_turn(turn)
  end 

end