**Linux-05 File permissions**
===

Leren hoe je bestanden toestemming geeft voor verschillende users en groepen.

**Key-terms**
---

*Permissions:* dit zijn de rechten die een gebruiker heeft voor bestanden. Dit kan als volgend aangegeven worden - rwx rw- r--.

* - rwx rw- r--:* "-" betekend dat dit een bestand is. als er een "d" voor staat gaat het om een directorie. De rest kan je opdelen in 3 delen rwx | rw- | r-- waarbij het eerste stukje over de rechten van de User gaat die in dit geval Read,Write en eXecute als rechten heeft, de 2e van groepen (deze mogen alleen Read en Write) en de 3e van other/overig die 2 "-"hebben, dit staat voor rechten die niet zijn toegestaan voor deze gebruiker.
 



**Opdracht**
---

- Create a text file.
- Make a long listing to view the file’s permissions. Who is the file’s owner and group? What kind of permissions does the file have?
- Make the file executable by adding the execute permission (x).
- Remove the read and write permissions (rw) from the file for the group and everyone else, but not for the owner. Can you still read it?
- Change the owner of the file to a different user. If everything went well, you shouldn’t be able to read the file unless you assume root privileges with ‘sudo’.
- Change the group ownership of the file to a different group.

*Gebruikte bronnen*

[Youtube](https://www.youtube.com/watch?v=BmVmJi5dR9c)

[ChatGPT](https://chat.openai.com)

*Ervaren problemen*

Vergat een aantal de txt file in het command te typen.

*Resultaat*

[Show permissions and create a text file](../00_includes/list%20perm%20files.png)

[Made it executable](../../../Pictures/screenshots%20CLOUD/made%20X.png)

[Removing permissions for the groups and everone else, i can read it still!](../../../Pictures/screenshots%20CLOUD/Icanread.png)

[Moving User and group at the same time](../../../Pictures/screenshots%20CLOUD/moving%20u%20g.png)