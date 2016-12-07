#!/bin/bash

# Nouveau timer

source .variables.sh
source .parts/timer/timer.sh

while :
do
  clear

  echo -e "\tNouveau timer"
  echo -e ""

  read -p "Nom du timer : " TIMER_NAME
  echo -e ""

  read -p "Durée de départ (en minutes) : " TIMER_TIME
  echo -e ""

  if ! [[ $TIMER_TIME =~ $REGEX_NUMBER ]] ; then
    echo -e "\tVous devez entrer un chiffre!"
    read
  else
    echo -e "\tLes informations sont-elles correctes?"
    read -p "Votre choix [O,N] : " CHOICE

    case $CHOICE in
      [oO])
        echo -e "\tCréation du timer..."
        
        Timer 'timer1' $TIMER_NAME $USER $TIMER_TIME

        echo -e "\tCréation terminé!"

        echo -e "\t"
        echo -e "\tVotre timer : "

        $timer1_show

        echo -e "\t"

        read -p "Voulez-vous démarrer le timer? [0,N] : " CHOICE

        if [ $CHOICE = "o" ] || [ $CHOICE = "O" ]; then
          $timer1_start
          echo -e "\tTimer démarré"
          echo ""
        fi

        $timer1_save
        echo -e "\tTimer sauvegardé"

        read
        exit
        ;;
      *)
        if [ $CHOICE = "n" ] || [ $CHOICE = "N" ]; then
          read -p "Voulez-vous recommencer? [0,N] : " CHOICE
        else
          read -p "Entrée invalide. Voulez-vous-recommencer? [0,N] : " CHOICE
        fi

        if [ $CHOICE != "o" ] && [ $CHOICE != "O" ];then
          exit
        fi
        ;;
    esac
  fi
done
