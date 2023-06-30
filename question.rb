class Question
  attr_accessor :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    num1 = rand(1..20)
    num2 = rand(1..20)

    puts "------ NEW TURN ------"
    puts "Player_#{turn}: What does #{num1} plus #{num2} equal?"
    print "> "

    answer = $stdin.gets.chomp.to_i

    if answer == num1 + num2
      puts "Yes! You are correct!"
      return true
    else 
      puts "Seriously? No!"
      return false
    end
  end

end 