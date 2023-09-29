#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo Enter your username:
read USERNAME




#get username 
USER=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
#if new username
if [[ -z $USER ]]
then
  echo Welcome, $USERNAME! It looks like this is your first \time here.
  #insert new user, with now 1 game played
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
  #this case USER and USERNAME are the same
  #get games played
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  #check how many times played and score
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

generate_random_number() {
  echo $((RANDOM % 1000 + 1))
}
target_number=$(generate_random_number)
echo $target_number
# Main game loop
# Initialize the attempt counter
attempts=0

while true; do
  
  # Generate a random number
  
  # Ask the user to guess the number
  read -p "Guess the secret number between 1 and 1000: " user_guess

  # Check if the user's guess is valid
  if [[ ! "$user_guess" =~ ^[0-9]+$ ]]; then
    echo "Please enter a valid number."
  elif ((user_guess < 1 || user_guess > 1000)); then
    echo "Please enter a number between 1 and 1000."
  else
    ((attempts++))
    # Compare the user's guess with the random number
    if ((user_guess < target_number)); then
      echo "It's higher than that, guess again:"
    elif ((user_guess > target_number)); then
      echo "It's lower than that, guess again:"
    else
      echo "You guessed it in <number_of_guesses> tries. The secret number was $target_number. Nice job!"
      echo "It took you $attempts attempts."
      break
    fi
  fi
done

#INSERT GAMES PLAYED 

#if none, add 1
if [[ -z $GAMES_PLAYED ]]
then
  GAMES_PLAYED=1
else
#if exists, add 1
  GAMES_PLAYED=$GAMES_PLAYED+1
fi

if [[ -z $BEST_GAME ]]
then
  #if none, add current score
  BEST_GAME=$attempts
else

  if [[ $BEST_GAME -lt $attempts ]]
  then
    #score antigo melhor
    BEST_GAME=$BEST_GAME

  else
    #score nobo melhor
    BEST_GAME=$attempts

  fi
fi



#insert new values into databae
INSERT_NEW_VALUES_USER=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'")

