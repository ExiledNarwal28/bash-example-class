#!/bin/bash

# Definition d'un timerWorker

# Source : http://hipersayanx.blogspot.ca/2012/12/object-oriented-programming-in-bash.html

source .variables.sh

# . .parts/timerWorker/timerWorker.sh
# TimerWorker '[timerWorker1]'
# TimerWorker $timerWorker1
#
# Fonction qui défini un timerWorker
function TimerWorker() {
  # Un TimerWorker dans la classe
  base=$FUNCNAME
  this=$1

  # Propriétés
  export ${this}_runningTimer="" # Timer en marche
  export ${this}_nextId=0 # Prochain ID à distribuer

  # Pour faire fonctionner les "méthodes"
  for method in $(compgen -A function)
  do
    export ${method/#$base\_/$this\_}="${method} ${this}"
  done
}

# timer_id = $timerWorker_getNextId
#
# Obtenir le prochain id et incrémenter le paramètre
function TimerWorker_getNextId() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  nextId=export ${this}_nextId # Timer actuel
  export ${this}_nextId=nextId+1 # Incrémente
  return nextId
}


# timer = $timerWorker_getRunningTimer
#
# Obtenir le timer actuel
function TimerWorker_getRunningTimer() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  return export ${this}_runningTimer # Timer actuel
}

# $timerWorker_setRunningTimer [timer]
# $timerWorker_setRunningTimer $timer1
#
# Démarrage du timer actuel
function TimerWorker_setRunningTimer() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  export ${this}_runningTimer=$2 # Nouveau timer actuel
}

# $timerWorker_stopRunningTimer
#
# Arrêt du timer actuel
function TimerWorker_stopRunningTimer() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  timer=export ${this}_runningTimer # Timer actuel
  timer_stop
  echo -e "\t\t\tTEST arrêt de $(eval "echo $timer_name")"
}
