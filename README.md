Web Guesser

A simple guessing game using Ruby, Sinatra, and ERB made for the web. This version changes background color based on proximity of guess, 
enables a cheat mode to check answers, allows only 5 guesses before player "loses" and number gets rerandomized. 
Also added an additional extension where player can check the number of guesses they have remaining without being penalized a guess.

Usage

Launch the application in your terminal with ruby web_guesser.rb. Then, in your web browser, navigate to `http://localhost:4567/`.

Should a user wish to cheat, they can do so by appending &cheat=true after the guess, e.g., `http://localhost:4567/?guess=34&cheat=true`.
To see how many guesses you have left, simply add the &guesses=left parameter in the URL - `http://localhost:4567/?guess=34&guesses=left`.
