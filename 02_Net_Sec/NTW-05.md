**NTW-05 IP adressen**
===
**Key-terms**
---

**IP-adres:** is een logisch adres dat aan eeen netwerkapparaat toegewezen kan worden. De netwerkapparaten kunnen dan met dit adres elkaar vinden op het netwerk.

**IPv4:** een IPv4 adres heeft 32 bits of 4 bytes en is meestal geschreven in decimalen. Je hebt publieke adressen, deze zijn echter allemaal al verkocht of gereserveerd. De 4 bytes in zo'n adres maken het mogelijk dat er 4,294,967,296 IPv4 adressen mogelijk zijn.

Je hebt nu per netwerk één publiek IP adress dat je deelt met alle apparaten op je netwerk. Dit is mogelijk door een NAT-tabel.

Er zijn 3 IP adres bereiken gereserveerd voor privé netwerken. iedereen gebruikt één van deze netwerken thuis of op werk. Deze zijn:

- 92.168.0.0 - 192.168.255.255

- 172.16.0.0 - 172.31.255.255

- 10.0.0.0 - 10.255.255.255


**NAT-tabel:** Een NAT-tabel houd bij welke verbindingen de apparaten in je privé netwerk maken met het publieke internet en zorgt er dan voor dat data als antwoord naar de juiste computers gestuurd worden.

**IPv6:** IPv6 is een andere oplossing voor het 'gebrek' aan IPv4 adressen. IPv6 adressen worden geschreven in hexadecimalen en bevatten 128bits waardoor de hoeveelheid zo groot word dat je alle zandkorrels op aarde 3 adressen kan geven, zeggen ze..  ;-) 

**Static and Dynamic ip addresses:** 

Dynamische adressen worden automatisch toegewezen maar veranderen regelmatig. 

Een statische adres wijs je één keer toe aan je netwerk en veranderd niet meer. Dit maakt lokaal communiceren makkelijk maar ook vatbaar voor eventuele dreigingen van buiten af.




**Opdracht**
---
- Ontdek wat je publieke IP adres is van je laptop en mobiel op wifi.

[Ipad](../00_includes/NTW-05/ipadWIFI.jpeg)    : 192.168.2.254

[Iphone](../00_includes/NTW-05/iphoneWIFI.jpeg) : 192.168.2.254

- Zijn de adressen hetzelfde of niet? Leg uit waarom.

Ja deze zijn het zelfde, dit is om ervoor te kunnen zorgen dat er makkelijk met het internet verbonden kan worden maar er niet voor elke router en apparaat wat daar aan gekoppel is een eigen IP adres nodig is.

- Ontdek wat je privé IP adres is van je laptop en mobiel op wifi.

[Ipad](../00_includes/NTW-05/ipadWIFI.jpeg)    : 192.168.2.12

[Iphone](../00_includes/NTW-05/iphoneWIFI.jpeg) : 192.168.2.8


- Zijn de adressen hetzelfde of niet? Leg uit waarom.

Nee deze zijn niet gelijk. Dit is het adres wat je router gebruikt om binnen je netwerk te communiceren en de juiste data naar het juiste apparaat te sturen.

- Verander het privé IP adres van je mobiel naar dat van je laptop. Wat gebeurt er dan?

Ik kan deze adressen veranderen, ik krijg echter wel de melding als ik op internet ga op mijn telefoon dat de website niet beschikbaar is en er geen server met de gespecificeerde hostname is te vinden.

- Probeer het privé IP adres van je mobiel te veranderen naar een adres buiten je     netwerk. Wat gebeurt er dan?

Hetzelfde, mijn telefoon laat het veranderen maar kan daarna geen verbinding meer maken met het internet.


*Gebruikte bronnen*

[Youtube](https://youtube.com)


*Ervaren problemen*

Bij het handmatig invoeren van IP-adressen lijkt het alsof het MAC adres al van te voren is ingevuld. Dit was niet het geval en moest dit zelf doen anders waren de nieuwe instellingen niet op te slaan.


*Resultaat*