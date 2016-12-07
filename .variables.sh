#!/bin/bash

source .parts/timerWorker/timerWorker.sh 

# Les variables générales
REGEX_NUMBER='^[0-9]+$'

# Les variables pour le menu
TIMERS_PER_PAGE=5

# TODO : Ceci n'est pas optimal. À la fin du programme, tout est effacé.
# Le TimerWorker général
TimerWorker $TIMERWORKER
