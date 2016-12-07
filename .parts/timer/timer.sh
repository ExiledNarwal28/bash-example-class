#!/bin/bash

# Definition d'un timer.

# Source : http://hipersayanx.blogspot.ca/2012/12/object-oriented-programming-in-bash.html

# On importer TIMERWORKER
source .parts/timerWorker/.timerWorkers.sh

# source .parts/timer/timer.sh
# Timer '[timer1]' '[Nom du timer]' [Temps du timer à sa création, en minutes]
# Timer $timer1 'Travail sur le script' 15
#
# Fonction qui défini un timer
function Timer() {
  # Un Timer dans la classe
  base=$FUNCNAME
  this=$1

  # Propriétés

  if [ -z $7 ]; then
    # Ici, c'est quand l'utilisateur crée un timer
    # export ${this}_id="" # TimerWorker generated id
    export ${this}_id=4242 # TimerWorker generated id
    export ${this}_name=$2 # Envoyé par l'utilisateur
    export ${this}_creator=$3 # Login de l'utilisateur
    export ${this}_createdDate="$(date)" # date actuelle
    export ${this}_lastStartedDate= # null par défaut
    export ${this}_time=$4 # temps en minute

    # $TIMERWORKER_getNextId ${this}_id
  else
    # Ici, c'est quand on lit un timer depuis un fichier.
    export ${this}_id=$2 # TimerWorker generated id
    export ${this}_name=$3 # Envoyé par l'utilisateur
    export ${this}_creator=$4 # Login de l'utilisateur
    export ${this}_createdDate=$5 # date actuelle
    export ${this}_lastStartedDate=$6 # null par défaut
    export ${this}_time=$7 # temps en minute
  fi

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
  $TIMERWORKER_stopRunningTimer

  # Démarrage du nouveau timer
  export ${this}_lastStartedDate=date # date actuelle

  # Mettre le nouveau timer comme timer actuel
  $TIMERWORKER_setRunningTimer ${this}
}

# timer_stop
#
# Stopper un timer
function Timer_stop() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  # Arrêt du timer actuel (this)
  # Vérifier que le timer est bien le timer actuel avant de modifier les informations
  if [${this} -eq $(eval "echo $TIMERWORKER_getRunningTimer]")]; then
    $TIMERWORKER_stopRunningTimer

    # Mise à jour des informations du timer
    export ${this}_time=$(eval "echo \$${this}_calcTime")
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
  
  if ["${this}" -eq "$TIMERWORKER_getRunningTimer"]; then
    echo -e "\tStatut : en fonction"
  else
    echo -e "\tStatut : arrêté"
  fi

  echo -e "\tTemps : $(eval "echo \$${this}_calcTime")"
}

# $timer1_showIndex
#
# Représentation limitée d'un Timer pour le menu principal
function Timer_showIndex() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  echo -e "\t\t$(eval "echo \$${this}_id")) $(eval "echo \$${this}_name")"
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
  if [${this} -eq $(eval echo "$TIMERWORKER_getRunningTimer")]; then
    now=$(date -d now +%s)
    lastStartedDate=$(date -d "$(eval "echo \$${this}_lastStartedDate")")

    time=$time + $now - $lastStartedDate
  fi

  return $time
}

# $timer1_save
#
# Sauvegarder le timer dans un fichier 
function Timer_save() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  # TODO : if le timer est dans le fichier
  # if [[ 1=1 ]]; then
    # on remplace la ligne où il est pour une nouvelle
  # else
  echo "Timer \$timerSaved$(eval "echo \$${this}_id") $(eval "echo \$${this}_id") '$(eval "echo \$${this}_name")' '$(eval "echo \$${this}_creator")' $(eval "echo \$${this}_createdDate") $(eval "echo \$${this}_lastStartedDate") $(eval "echo \$${this}_time")" >> .parts/timer/.timers.sh
  # fi
}
