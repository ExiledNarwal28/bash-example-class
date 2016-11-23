#!/bin/bash

# Auteur         : Fabien Roy
#
# Date de départ : 2016-11-23
#
# Date de fin    : 2016-XX-XX
#
# Programme      : Gestionnaire de saisie de temps
#
# Description    : Ce programme permet aux employés d'une compagnie
#                  de saisir leur temps de travail, tout en gardant
#                  en mémoire les processus ouvert et utilisés
#                  pendant qu'ils travaillent.

source .variables.sh

while ${CHOICE,,} -neq "q"; do
  clear

  echo "MENU PRINCIPAL"
  echo ""
  echo "Bonjour à vous, $USER"
  echo ""
  echo "Vous avez travailler X heures aujourd'hui"
  echo ""
  echo "Vos timers : "
  echo ""

  echo "0) [Nouveau timer]"
  echo "1) Faux timer"
  echo "2) Autre faux timer"
  echo ""

  echo "C) Configuration"
  echo "S) Statistiques"
  echo "Q) Quitter"
  echo ""

  echo "Votre choix : "
  read CHOICE

  case $CHOICE in
    [cC]) echo "Configuration"
      ;;
    [sS]) echo "Statistiques"
      ;;
  esac
done
