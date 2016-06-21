require 'pry'
require 'sinatra'
require 'sinatra/reloader'

  @@guesses_left = 5

  secret_number = rand(100)

  get '/' do 
    @@guesses_left -= 1
    guess = params[:guess].to_i
    guesses_remaining = guesses_remaining(params[:guesses])
    cheat_mode = cheat_check(params[:cheat], secret_number)
    message = send_message(guess, secret_number)
    color = find_color(message)
    secret_number = rand(100) if rerandomize?(guess, secret_number)
    erb :index, :locals => {:secret_number => secret_number, :guess => guess, :message => message, :color => color, :guesses_remaining => guesses_remaining, :cheat_mode => cheat_mode}
  end

  def find_color(message)
    if loser?(message)
      give_the_loser_a_color(message)
    else
      "#99ffbb"
    end
  end

  def loser?(message)
    if message.downcase.include?("too") || message.include?("lose!")
      give_the_loser_a_color(message)
    end
  end

  def give_the_loser_a_color(message)
    if message.include?("Too")
      "#ff8080"
    elsif message.include?("lose!")
      "#800033"
    else
      "#ff0000"
    end
  end


  def send_message(guess, secret_number)
    if guess == secret_number
      grudge_match?(secret_number)
    else
      guess_check(guess, secret_number)
    end
  end

  def guesses_remaining(guess)
    if guess == "left"
      @@guesses_left += 1
      "Guesses remaining: #{@@guesses_left}"
    end
  end

  def off_check(guess, secret_number)
    if guess > secret_number
      too_high(guess, secret_number)
    else
      too_low(guess, secret_number)
    end
  end

  def guess_check(guess, secret_number)
    if @@guesses_left == 0
      "\nYou're out of guesses...so you lose!"
    else
      off_check(guess, secret_number)
    end
  end

  def too_high(guess, secret_number)
    if guess - 5 > secret_number
      "Way too high!"
    else
      "Too high!"
    end
  end

  def too_low(guess, secret_number)
    if guess + 5 < secret_number
      "Way too low!"
    else
      "Too low!"
    end
  end

  def rerandomize?(guess, secret_number)
    if @@guesses_left == 0 || guess == secret_number
      @@guesses_left = 5
      true
    end
  end

  def grudge_match?(secret_number)
    "Correct! The secret_number is #{secret_number}\n"
    "You win!!\nFive more guesses!"
  end

  
  def cheat_check(cheat, secret_number)
    if cheat == "true"
      "(psst...#{secret_number})"
    end
  end
