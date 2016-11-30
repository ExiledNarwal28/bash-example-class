#!/bin/bash

# Definition d'un timer.

# Source : http://hipersayanx.blogspot.ca/2012/12/object-oriented-programming-in-bash.html

source .variables.sh

# Fonction qui défini un timer
function Timer() {
  # Un Timer dans la classe
  base=$FUNCNAME
  this=$1

  # Propriétés
  export ${this}_id=$2
  export ${this}_name=$3
  export ${this}_createdDate=$4
  export ${this}_lastStartedDate=$5
  export ${this}_running=$6
  export ${this}_time=$7

  # Pour faire fonctionner les "méthodes"
  for method in $(compgen -A function)
  do
    export ${method/#$base\_/$this\_}="${method} ${this}"
  done
}

# Démarrer une timer
function Timer_start() {
  # TODO
  echo "lol"
}

# Stopper un timer
function Timer_stop() {
  # TODO
  echo "lol"
}

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

# Représentation complète d'un Timer
function Timer_showFull() {
  base=$(expr "$FUNCNAME" : '\([a-zA-Z][a-zA-Z0-9]*\)')
  this=$1
  
  # TODO
}

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
