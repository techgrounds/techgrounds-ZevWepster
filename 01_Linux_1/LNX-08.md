**Linux-08 Cron jobs**
===

**Key-terms**
---

*Cron Job:* 

*CronTab:*

**Opdracht**
---
- Create a Bash script that writes the current date and time to a file in your home directory.

- Register the script in your crontab so that it runs every minute.

- Create a script that writes available disk space to a log file in ‘/var/logs’. Use a cron job so that it runs weekly.


*Gebruikte bronnen*

[TecAdmin](https://tecadmin.net/get-current-date-and-time-in-bash/#:~:text=Getting%20the%20current%20date%20and%20time%20in%20a%20Bash%20script,in%20any%20format%20you%20like.)

[linuxize](https://linuxize.com/post/bash-write-to-file/)

[LinuxFoundation](https://www.linuxfoundation.org/blog/blog/classic-sysadmin-how-to-check-disk-space-on-linux-from-the-command-line#:~:text=That%20command%20is%20df%20%2DH,your%20system%20(Figure%201))

*Ervaren problemen*

Ik had [eerst](../../../Portfolio%20Zev-Wepster/00_includes/LNX-08/telltime.png)  een script geschreven wat het op de terminal weergaf ipv naar een textfile. hierbij moest ik nog een beetje zoeken naar wat waar te zetten. Ook had ik in mijn hoofd zitten dat we alleen de tijd moesten weergeven. Ik zie het als extra oefening!



*Resultaat*

[Time added to file](../../../Portfolio%20Zev-Wepster/00_includes/LNX-08/timeInfile.png)

[Writing available diskspace to a log file](../../../Portfolio%20Zev-Wepster/00_includes/LNX-08/diskspace.png) , it runs every tuesday at 1 AM.

[Crontab](../../../Portfolio%20Zev-Wepster/00_includes/LNX-08/NANOcronjobs.png)



