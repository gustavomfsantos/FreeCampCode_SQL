#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#To run on test database, use test as argument when running the shell file
echo $($PSQL "TRUNCATE games, teams") #Reset tables when running script

#open file and get columns. Ajust sep argument
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #first info to add is team to table team
  if [[ $WINNER != winner ]]
  then
    #Get team winner
    WINNER_NAME=$($PSQL "SELECT name FROM teams WHERE name = '$WINNER'")
    #if there is no team on table
    if [[ -z $WINNER_NAME ]]
    then 
      #insert team that is not on table yet
      echo $WINNER
      ISERT_WINNER_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ ISERT_WINNER_NAME == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $WINNER
      fi
    fi
  fi
  if [[ $OPPONENT != opponent ]]
  then
    #Get team winner
    OPPONENT_NAME=$($PSQL "SELECT name FROM teams WHERE name = '$OPPONENT'")
    #if there is no team on table
    if [[ -z $OPPONENT_NAME ]]
    then 
      #insert team that is not on table yet

      ISERT_OPPONENT_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ ISERT_OPPONENT_NAME == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    fi
  fi
  if [[ $YEAR != year ]]
  then
    #get winner id from teams table
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        #insert GAMES
    INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, opponent_goals, winner_goals) 
     VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $OPPONENT_GOALS, $WINNER_GOALS) ")
    if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into teams, $WINNER $OPPONENT $YEAR
    fi
  fi
done #teams and games tables populated


