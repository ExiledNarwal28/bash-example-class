Auteur : 

        Fabien Roy

Date : 

        16-11-23 16-12-07

Programme : 

        Programme de gestion de saisie de temps

Description : 

        Un utilisateur peut créer un timer qui a un nom et un temps total. On peut activer/désactiver des timers. Les timers peuvent s'enregistrer. On liste les processus qui ont été en fonction pendant chaque timer.
        Ce programme n'est pas du tout terminé. Par contre, il peut servir d'une excellente référence sur comment faire des classes/méthodes/objets en bash. Il y a beaucoup de commentaires et les méthodes sont expliquées.
        
        Les fichiers entre parenthèses n'ont pas été commencés

        main.sh : le menu principal, l'entrée du programme
        (settings.sh) : un menu de configuration
        .variables.sh : les variables utilisées partout dans le programme
        (.parts/stats.sh) : un menu où l'on affiche diverses statistiques
        .parts/timer/timer.sh : définition de la "classe" Timer
        .parts/timer/new.sh : menu pour faire un nouveau Timer
        (.parts/timer/index.sh) : menu principal d'un Timer
        (.parts/timer/edit.sh) : menu pour éditer un Timer
        (.parts/timer/delete.sh) : menu pour supprimer un Timer
        (.parts/timer/switch-running.sh) : menu pour arrêter/mettre en marche un Timer
        (.parts/timer/info.sh) : menu pour voir les détails d'un Timer (les processus)

Problèmes : 

        #1 Le ID des timers ne marche pas. C'est à cause du retour de TimerWorker