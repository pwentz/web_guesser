require 'sinatra'
require 'sinatra/reloader'
secret_number = rand(100)
get '/' do 
  guess = params[:guess].to_i
  message = send_message(guess, secret_number)
  erb :index, :locals => {:secret_number => secret_number, :guess => guess, :message => message}
end

def send_message(guess, secret_number)
  if guess == secret_number
    "Correct! The secret_number is #{secret_number}"
  else
    off_check(guess, secret_number)
  end
end

def off_check(guess, secret_number)
  if guess > secret_number
    too_high(guess, secret_number)
  else
    too_low(guess, secret_number)
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



