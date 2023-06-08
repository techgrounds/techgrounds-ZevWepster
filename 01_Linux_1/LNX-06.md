**Linux-06 Processes**
===

Leren over de processen in Linux. Deze processen worden onder verdeeld in 3 catergorien: Daemons, Services, Programs.
Ook maakte we kennis met telnet.

**Key-terms**
---

*Daemons:* Een daemon runt op de achtergrond en in "non-interactive"

*Services:* Een service reageerd op opdrachten die vanuit het programma komen.

*Programs:* Een programma word opgestart en gebruikt door gebruikers

*Telnet:* De voorloper van SSH. het grootse en belangrijkste verschil is dat SSH al het verkeer encrypt. Dit gebeurt niet bij het gebruik van telnet en maakt dit een onveilige optie voor remote access


**Opdracht**
---
- Start the telnet daemon.

- Find out the PID of the telnet daemon.

- Find out how much memory telnetd is using.

- Stop or kill the telnetd process.



*Gebruikte bronnen*

[Digitalocean](https://www.digitalocean.com/community/tutorials/telnet-command-linux-unix#summary)

[Link van Shikha na mezelf te hebben uitgelogd](http://www.beginninglinux.com/home/server-administration/firewall/enable-firewall-on-server-without-ssh-disconnect)

*Ervaren problemen*

Door de verkeerde firewall command te gebruiken (sudo ufw enable) had ik mezelf uitgelogd. Dit heeft me wat tijd gekost om uit te zoeken wat er aan de hand was en of ik het zelf kon fixen, dit lukte niet en heb hulp van Shikha gevraagd.

*Resultaat*

[Connecting to telnet](../00_includes/LNX-06/connecting%20to%20telnet.png)

[PID and memory info](../00_includes/LNX-06/telnet%20info.png)

[Kill process](../00_includes/LNX-06/killprocess.png) 






