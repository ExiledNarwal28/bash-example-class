# Bash example : simulating object-oriented programming # 

**This program is unfinished. This is a school project where I had to work for a specific number of hours, so it is not completed. It still is a fantastic example of an object-oriented program simulated in bash.**

Also, there might be some French in there (sorry, school project requirements). I will translate it if anyone sees a use for this program.

## What does it do? (say it was completed) ##

I got most of my inspiration from Harvest. A user can create a timer with a name and a total time.  The user can activate or deactivate timers. Timers can be saved. Each timers has a list of processes running while the timer is running.
        
## Files ##

*Files between parantheses were not developped*

        main.sh                             : Main file, the start of program
        (settings.sh)                       : Configuration menu (nomber of timers per page, ...)
        .variables.sh                       : Global variables used througout the program
        (.parts/stats.sh)                   : Menu where stats are shown (who worked the most, total time for week/month/year, ...)
        .parts/timer/timer.sh               : Definition of Timer "class"
        .parts/timer/new.sh                 : Menu for making a new Timer
        (.parts/timer/index.sh)             : Detail screen for a Timer
        (.parts/timer/edit.sh)              : Edit screen for a Timer
        (.parts/timer/delete.sh)            : Delete screen for a Timer
        (.parts/timer/switch-running.sh)    : Menu for activating/deactivating a Timer
        (.parts/timer/info.sh)              : Menu to see processes details of a Timer (what processes where running while Timer was running)
        .parts/timer/.timers.sh             : File to save Timers
        .parts/timerWorker/timerWorker.sh   : Definition of TimerWorker "class"; Class for managing Timers
        .parts/timerWorker/.timerWorkers.sh : File to save TimerWorker (to know which Timer is running)

## Problems ##

        #1  Timers' ID do not work. This is because of TimerWorker's returning a wrong ID.
        #2  Comparison to know if a Timer is running does not work ($timer=$TIMERWORKER_getRunningTimer is not working...)
        #3  Reading of .parts/timer/.timers.sh is not developped
        #4  Saving Timers does not work since ID is not relevant (see #1)
        #5  All Timers' menus are not done (index, edit, delete, switch-running and info)
        #6  Nothing was developped to save running processes
        #7  TimerWorker's runningTimer is not linked to the $USER (Linux user)
        #8  Configuration menu is not developped
        #9  Stats menu is not developped
        #10 Changing the running Timer with TimerWorker does not work (see #2)
