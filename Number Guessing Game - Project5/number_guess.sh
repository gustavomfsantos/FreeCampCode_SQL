#! /bin/bash
#PSQL command to interact with database using SQL. 
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#Sort number
NUMBER=$(( RANDOM % 1000 + 1 ))

#First echo
echo -e "Enter your username:"
read USERNAME

#Get user
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

#iCheck if user is new or not. Display messages for each case
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
  BEST_GAME_TRIES=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID") 
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME_TRIES guesses."

fi

#Second Echo
echo "Guess the secret number between 1 and 1000:"
read USER_NUMBER

#Count first try
TRIES=1

#Do a loop between options and count tries
while true
do
  if [[ $USER_NUMBER =~ ^[0-9]+$ ]] #if input is an integer, continue
  then
    if [[ $USER_NUMBER -gt $NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      read USER_NUMBER
      TRIES=$(( $TRIES+1 ))
    else
      if [[ $USER_NUMBER -lt $NUMBER ]]
      then
        echo "It's higher than that, guess again:"
        read USER_NUMBER
        TRIES=$(( $TRIES+1 ))
      else
        echo "You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"
        break
      fi
    fi
    else    
  echo "That is not an integer, guess again:"
  read USER_NUMBER

  fi
done

#Insert data into database
if [[ -z $GAMES_PLAYED ]]
then 
  GAMES_PLAYED=0 
  GAMES_PLAYED=$(( $GAMES_PLAYED+1 ))
  GAMES_PLAYED_INCREMENT_RESULT=$($PSQL "INSERT INTO users(games_played,best_game,username) VALUES($GAMES_PLAYED,$TRIES,'$USERNAME')")
  BEST_GAME_TRIES=$TRIES
else   
  GAMES_PLAYED=$(( $GAMES_PLAYED+1 ))
  GAMES_PLAYED_INCREMENT_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE user_id=$USER_ID")
  if [[ $TRIES -lt $BEST_GAME_TRIES ]]
  then
    BEST_GAME_UPDATE=$($PSQL "UPDATE users SET best_game=$TRIES WHERE user_id=$USER_ID")
  fi 
 
fi  