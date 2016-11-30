#!/bin/bash

# Definition d'un timer.

# Source : http://hipersayanx.blogspot.ca/2012/12/object-oriented-programming-in-bash.html

source .variables.sh

# . .parts/timer/timer.sh
# Timer '[timer1]' '[Nom du timer]' [Temps du timer à sa création, en minutes]
# Timer timer1 'Travail sur le script' 15
#
# Fonction qui défini un timer
function Timer() {
  # Un Timer dans la classe
  base=$FUNCNAME
  this=$1

  # Propriétés
  export ${this}_id=1 # TODO TimerWorker generated id
  export ${this}_name=$2 # Envoyé par l'utilisateur
  export ${this}_createdDate=date # date actuelle
  export ${this}_lastStartedDate= # null par défaut
  export ${this}_running=false # N'est pas en marche par défaut
  export ${this}_time=0 # temps en minute

  # Pour faire fonctionner les "méthodes"
  for method in $(compgen -A function)
  do
    export ${method/#$base\_/$this\_}="${method} ${this}"
  done
}

# timer1_start
#
# Démarrer une timer
function Timer_start() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  # Arrêt du timer actuel
  # TODO

  # Démarrage du nouveau timer
  export ${this}_running=true
  export ${this}_lastStartedDate=date # date actuelle

  # Mettre le nouveau timer comme timer actuel
  # TODO
}

# timer_stop
#
# Stopper un timer
function Timer_stop() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  # Arrêt du timer actuel (this)
  # TODO
  # TODO : Vérifier que le timer est bien le timer actuel avant de modifier les informations

  # Mise à jour des informations du timer
  export ${this}_time= $(eval "echo \$${this}_calcTime")
  export ${this}_running=false
}

# timer1_show
#
# Représentation simple d'un Timer
function Timer_show() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  echo "Nom : $(eval "echo \$${this}_name")"
  echo "Date de création : $(eval "echo \$${this}_createdDate")"
  
  if $(eval "echo \$${this}_running"); then
    echo "Statut : en fonction"
  else
    echo "Statut : arrêté"
  fi

  echo "Temps : $(eval "echo \$${this}_calcTime")"
}

# timer1_showIndex ['No d'index']
# timer1_showIndex 2
#
# Représentation limitée d'un Timer pour le menu principal
function Timer_showIndex() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1

  echo "$2) $(eval "echo \$${this}_name")"
}

# TODO
#
# Représentation complète d'un Timer
function Timer_showFull() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1
  
  # TODO
}

# timer1_calcTime
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

# vector1_add vector2
#
# # Adds two vectors.
# function Vector_add()
# {
#   base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
#   this=$1
#   other=$2

#   # Get it's components
#   x1=$(eval "echo \$${this}_x")
#   y1=$(eval "echo \$${this}_y")
#   z1=$(eval "echo \$${this}_z")

#   x2=$(eval "echo \$${other}_x")
#   y2=$(eval "echo \$${other}_y")
#   z2=$(eval "echo \$${other}_z")

#   # Add it's components
#   x=$(($x1 + $x2))
#   y=$(($y1 + $y2))
#   z=$(($z1 + $z2))

#   # Create a new vector. (8)
#   Vector 'vector3' $x $y $z

#   $vector3_show
# }
