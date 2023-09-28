#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[  -z "$1" ]]
then
  echo Please provide an element as an argument.

else
  # Check if the argument is a number
  if [[ "$1" =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$1
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
  fi

  # Check if the argument is a single letter
  if [[ "$1" =~ ^[a-zA-Z]+$ && ${#1} -lt 3 ]] 
  then
    SYMBOL=$1
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$SYMBOL'")
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
  fi

  # Check if the argument is a word (string)
  if [[ "$1" =~ ^[a-zA-Z]+$ && ${#1} -gt 2 ]]
  then
    NAME=$1
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$NAME'")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
  fi

  ATOMIC_NUMBER_CHECK=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
  if [[ -z $ATOMIC_NUMBER_CHECK ]]
  then
    echo I could not find that element in the database.
  else  
    TYPE=$($PSQL "SELECT type FROM elements LEFT JOIN properties USING(atomic_number) 
    LEFT JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")
    MASS=$($PSQL "SELECT atomic_mass FROM elements LEFT JOIN properties USING(atomic_number) 
      WHERE atomic_number=$ATOMIC_NUMBER")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM elements LEFT JOIN properties USING(atomic_number) 
      WHERE atomic_number=$ATOMIC_NUMBER")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM elements LEFT JOIN properties USING(atomic_number) 
      WHERE atomic_number=$ATOMIC_NUMBER")

    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
fi