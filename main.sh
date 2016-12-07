#!/bin/bash

# Auteur         : Fabien Roy
#
# Date de départ : 2016-11-23
#
# Date de fin    : 2016-12-07
#
# Programme      : Gestionnaire de saisie de temps
#
# Description    : Ce programme permet aux employés d'une compagnie
#                  de saisir leur temps de travail, tout en gardant
#                  en mémoire les processus ouvert et utilisés
#                  pendant qu'ils travaillent.

source .parts/timerWorker/timerWorker.sh
source .parts/timerWorker/.timerWorkers.sh

while :
do
  clear

  echo -e "\tMENU PRINCIPAL"
  echo -e ""
  echo -e "\tBonjour à vous, $USER"
  echo -e ""
  echo -e "\tVous avez travailler X heures aujourd'hui"
  echo -e ""

  echo -e "\tVos timers : "
  echo -e ""
  echo -e "\t\t0) [Nouveau timer]"
  echo -e "\t\t1) Faux timer"
  echo -e "\t\t2) Autre faux timer"
  echo -e ""

  echo -e "\tOptions : "
  echo -e ""
  echo -e "\t\tC) Configuration"
  echo -e "\t\tS) Statistiques"
  echo -e "\t\tQ) Quitter"
  echo -e ""

  read -p "Votre choix : " CHOICE

  case $CHOICE in
    0)
      /bin/bash .parts/timer/new.sh
      ;;

    [cC]) 
      clear
      echo "Configuration"
      read
      ;;

    [sS]) 
      clear
      echo "Statistiques"
      read
      ;;

    [qQ]) 
      exit
      ;;
     
    *)
      # if is a number
      #   .parts/timer/index.sh $CHOICE
      # else
      #   echo "Entrée invalide."
      # fi
      ;;
  esac
done
