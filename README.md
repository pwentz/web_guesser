## Web Guesser
A simple guessing game using Ruby, Sinatra, and ERB made for the web. This version changes background colors based on the proximity of the user's guess to the randomly generated number (0 to 100), limits the number of guesses per game to 5,
enables a "cheat" mode for users to check the answer.

Also implemented an additional extension where a user can check the number of guesses they have remaining without being penalized a guess.

### Usage
Launch the application in your terminal with `ruby web_guesser.rb`. Then, in your web browser, navigate to `http://localhost:4567/`.

Should a user wish to cheat, they can do so by appending `&cheat=true` after the guess, e.g., `http://localhost:4567/?guess=34&cheat=true`.

To check the number of guesses remaining, a user can add the `&guesses=left` parameter to the end of the URL,
e.g., `http://localhost:4567/?guess=34&guesses=left`.
