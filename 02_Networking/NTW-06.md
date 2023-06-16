**NTW-06 Subnetting**
===
**Key-terms**
---

**LAN:** Local Area Network, dit word vaak uitgedrukt als een range aan IP adressen. Elk device (host) krijgt een eigen adres aangewezen binnen die host.

**Subnet mask (prefix):** Om dit te ondersteunen hebben netwerken een subnet mask (prefix) die definieert hoeveel bits van het IP adres onderdeel uitmaken van het netwerkadres, en hoeveel bits gereserveerd zijn voor de host.

**Subnet:** Is een kleiner netwerk dat onderdeel is van een groter netwerk. Subnets kunnen worden gebruikt om een deel van het netwerk logisch te isoleren.
Een subnet heeft per definitie een grotere prefix dan het netwerk waar het subnet in zit.

**CIDR:** is een methode om IP-adressen aan te duiden. Dit werd in 1993 geintroduceerd als vervanger voor de vroegere adressering op basis van klassen (A/B/C), met als doel de snelle groei van de routingtabellen tegen te houden en het probleem van de beperkte IP-adresruimte aan te pakken.

Het belangrijkste verschil met adressering op basis van klassen, is dat bij CIDR exact (op bit-niveau) wordt aangeduid welke bits van een 32-bit IPv4-adres tot het netwerkgedeelte behoren en welke gebruikt worden om de hosts in dat netwerk aan te duiden. 

De CIDR notatie is dezelfde als bij een IPv4-adres, maar met een "/" (slash) erachter, gevolgd door een decimaal getal tussen 0 en 32 dat het aantal significante bits aanduidt



**Opdracht**
---
- Maak een netwerkarchitectuur die voldoet aan de volgende eisen:

    - 1 private subnet dat alleen van binnen het LAN bereikbaar is. Dit subnet moet minimaal 15 hosts kunnen plaatsen.
    - 1 private subnet dat internet toegang heeft via een NAT gateway. Dit subnet moet minimaal 30 hosts kunnen plaatsen (de 30 hosts is exclusief de NAT gateway).
    - 1 public subnet met een internet gateway. Dit subnet moet minimaal 5 hosts kunnen plaatsen (de 5 hosts is exclusief de internet gateway).

- Plaats de architectuur die je hebt gemaakt inclusief een korte uitleg in de Github repository die je met de learning coach hebt gedeeld.



*Gebruikte bronnen*

[app.diagram](https://app.diagrams.net/)

[Bytes of gigabytes](https://bytesofgigabytes.com/networking/what-is-subnetting-in-networking/)

[whatsmypublicip](https://www.whatismypublicip.com/blog/what-is-an-internet-gateway/)

[Youtube](https://www.youtube.com/watch?v=BWZ-MHIhqjM&ab_channel=PracticalNetworking)

[Avine networks](https://avinetworks.com/glossary/subnet-mask/)

[Networklessons](https://networklessons.com/cisco/ccna-routing-switching-icnd1-100-105/what-is-subnetting)

[DNSstuff](https://www.dnsstuff.com/subnet-ip-subnetting-guide)

[AVG](https://www.avg.com/nl/signal/public-vs-private-ip-address)

*Ervaren problemen*

Zoals te zien is in de bronvermelding heb ik een stuk meer bronnen gebruikt dan in de vorige opdrachten. Het duurde even voordat alles klikte dus heb het op veel manieren aangevlogen. Door gaan naar de volgende oopdracht, heeft uiteindelijk ook geholpen.

*Resultaat*

Hier onder vind je mijn tekening voor de gevraagde subnets. 

Het eerste subnet is prive en bevat ruimte voor in ieder geval 15 hosts.
het tweede subnet is ook prive en heeft 62 bruikbare host adressen.
Beide netwerken hebben hebben meer ruimte dan vereist, dit is omdat de 'kleinere' verdeling voor beide netwerken te klein is voor het vereiste aantal hostst.

![subnetting](architect.png)