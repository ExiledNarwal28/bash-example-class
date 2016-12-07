#!/bin/bash

# Definition d'un timer.

# Source : http://hipersayanx.blogspot.ca/2012/12/object-oriented-programming-in-bash.html

# On importer TIMERWORKER
source .variables.sh

# . .parts/timer/timer.sh
# Timer '[timer1]' '[Nom du timer]' [Temps du timer à sa création, en minutes]
# Timer $timer1 'Travail sur le script' 15
#
# Fonction qui défini un timer
function Timer() {
  # Un Timer dans la classe
  base=$FUNCNAME
  this=$1

  # Propriétés
  export ${this}_id=TIMERWORKER_getNextId # TimerWorker generated id
  export ${this}_name=$2 # Envoyé par l'utilisateur
  export ${this}_creator=$3 # Login de l'utilisateur
  export ${this}_createdDate=date # date actuelle
  export ${this}_lastStartedDate= # null par défaut
  export ${this}_running=false # N'est pas en marche par défaut
  export ${this}_time=$4 # temps en minute

  # Pour faire fonctionner les "méthodes"
  for method in $(compgen -A function)
  do
    export ${method/#$base\_/$this\_}="${method} ${this}"
  done
}

# $timer1_start
#
# Démarrer une timer
function Timer_start() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  # Arrêt du timer actuel
  TIMERWORKER_stopRunningTimer

  # Démarrage du nouveau timer
  export ${this}_running=true
  export ${this}_lastStartedDate=date # date actuelle

  # Mettre le nouveau timer comme timer actuel
  TIMERWORKER_setRunningTimer ${this}
}

# timer_stop
#
# Stopper un timer
function Timer_stop() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  # Arrêt du timer actuel (this)
  # Vérifier que le timer est bien le timer actuel avant de modifier les informations
  if [${this}=TIMERWORKER_getRunningTimer]; then
    TIMERWORKER_stopRunningTimer

    # Mise à jour des informations du timer
    export ${this}_time=$(eval "echo \$${this}_calcTime")
    export ${this}_running=false
  else
    echo -e "\t\t\t Erreur, le timer n'est pas le timer en marche, d'après TimerWorker?"
  fi
}

# $timer1_show
#
# Représentation simple d'un Timer
function Timer_show() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  echo -e "\tID : $(eval "echo \$${this}_id")"
  echo -e "\tNom : $(eval "echo \$${this}_name")"
  echo -e "\tDate de création : $(eval "echo \$${this}_createdDate")"
  echo -e "\tCréateur : $(eval "echo \$${this}_creator")"
  
  if $(eval "echo \$${this}_running"); then
    echo -e "\tStatut : en fonction"
  else
    echo -e "\tStatut : arrêté"
  fi

  echo -e "\tTemps : $(eval "echo \$${this}_calcTime")"
}

# $timer1_showIndex ['No d'index']
# $timer1_showIndex 2
#
# Représentation limitée d'un Timer pour le menu principal
function Timer_showIndex() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

}

# TODO
#
# Représentation complète d'un Timer
function Timer_showFull() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1
  
  # TODO
}

# $timer1_calcTime
#
# Calculer le temps d'un timer
function Timer_calcTime() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  time=$(eval "echo \$${this}_time")

  # Si le timer est en fonction, on doit afficher le temps + le temps depuis la dernière mise en fonction
  if $(eval "echo \$${this}_running"); then
    now=$(date -d now +%s)
    lastStartedDate=$(date -d "$(eval "echo \$${this}_lastStartedDate")")

    time=$time + $now - $lastStartedDate
  fi

  return $time
}
