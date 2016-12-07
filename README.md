#Programme de gestion de saisie de temps#

**Auteur :** Fabien Roy

**Date :** 16-11-23 16-12-07

**Description :** Un utilisateur peut créer un timer qui a un nom et un temps total. On peut activer/désactiver des timers. Les timers peuvent s'enregistrer. On liste les processus qui ont été en fonction pendant chaque timer.

Ce programme n'est pas du tout terminé. Par contre, il peut servir d'une excellente référence sur comment faire des classes/méthodes/objets en bash. Il y a beaucoup de commentaires et les méthodes sont expliquées.
        
##Fichiers: ##

*Les fichiers entre parenthèses n'ont pas été commencés*

        main.sh : le menu principal, l'entrée du programme
        (settings.sh) : un menu de configuration (nombre de timers par page de main.sh, ...)
        .variables.sh : les variables utilisées partout dans le programme
        (.parts/stats.sh) : un menu où l'on affiche diverses statistiques (qui a travaillé le plus, temps de la semaine/mois/année, ...)
        .parts/timer/timer.sh : définition de la "classe" Timer
        .parts/timer/new.sh : menu pour faire un nouveau Timer
        (.parts/timer/index.sh) : menu principal d'un Timer
        (.parts/timer/edit.sh) : menu pour éditer un Timer
        (.parts/timer/delete.sh) : menu pour supprimer un Timer
        (.parts/timer/switch-running.sh) : menu pour arrêter/mettre en marche un Timer
        (.parts/timer/info.sh) : menu pour voir les détails d'un Timer (les processus)
        .parts/timer/.timers.sh : fichier où l'on enregistre les Timers
        .parts/timerWorker/timerWorker.sh : définition de la "classe" TimerWorker
        .parts/timerWorker/.timerWorkers.sh : fichier où l'on enregistre le TimerWorker (pour avoir le runningTimer)

##Problèmes : ##

        #1 Le ID des timers ne marche pas. C'est à cause du retour de TimerWorker
        #2 La comparaison pour savoir si un timer est en marche ne fonctionne pas ($timer=$TIMERWORKER_getRunningTimer ne semble pas être correct...)
        #3 La lecture du fichier .parts/timer/.timers.sh n'est pas fait
        #4 L'enregistrement fonctionne mal à cause du id inexact (problème #1)
        #5 Les menus de Timer ne sont pas fait (index, edit, delete, switch-running et info)
        #6 Rien n'a été fait pour enregistrer les processus encore
        #7 Le runningTimer n'est pas lié au $USER
        #8 Le menu de configuration n'est pas fait
        #9 La page de statistiques n'est pas fait
        #10 Le changement de timer actif ne fonctionne pas dans TimerWorker (problème #2)