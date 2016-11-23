#!/bin/bash

# Nouveau timer

source .variables.sh

while :
do
  clear

  echo "Nouveau timer"
  echo ""

  read -p "Nom du timer : " TIMER_NAME
  echo ""

  read -p "Durée de départ (en minutes) : " TIMER_TIME
  echo ""

  if ! [[ $TIMER_TIME =~ $REGEX_NUMBER ]] ; then
    echo "Vous devez entrer un chiffre!"
    read
  else
    echo "Les informations sont-elles correctes ?"
    read -p "Votre choix [O,N] : " CHOICE

    case $CHOICE in
      [oO])
        echo "ok d'abord"
        read
        exit
        ;;
    esac
  fi
done
