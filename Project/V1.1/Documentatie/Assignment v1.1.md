# Project v1.1

## Intro
In de afgelopen weken heb je gewerkt aan de eerste versie van je applicatie. Deze heb je ook afgelopen vrijdag opgeleverd. Je hebt geleerd hoe om te gaan met de CDK of Bicep. Je hebt een applicatie opgebouwd. Je hebt nagedacht over hoe je de klant informeert over het gebruik van je applicatie.

Mogelijk heb je nog niet alles af gekregen en dat is niet erg. In dit geval zou je aangeven bij je leidinggevende dat je meer tijd nodig hebt en dit met de klant bespreken. Omdat dit nog een simulatie is, is dit niet nodig. De focus is het leren van de concepten die je nodig zal hebben om een bijdrage te leveren aan je toekomstige team. En als je blijft leren is er geen tijd verspilt.

Ongeacht de status van je v1.0 applicatie, is dit niet het einde van het project. Klanten kunnen vaak van gedachten veranderen en van meer ‘features’ gebruik willen maken. Het ontwikkelen van deze extra features wordt normaal gesproken vooraf overlegd met de product owner.

## Opdracht
De klant is tevreden met de oplevering van je applicatie. Dit is alleen niet het einde. De klant wil graag meer gebruik maken van de mogelijkheden van de cloud. Daarnaast heeft de klant nog opmerkingen over de beveiliging van de applicatie.

Er zijn nog geen user stories uitgeschreven voor deze nieuwe features. De product owner was een lang weekend weg en heeft hier nog geen tijd voor gehad. Je moet de user stories dus zelf schrijven.

## Nieuwe eisen:
De klant wilt graag gebruik maken van meer mogelijkheden van de cloud. Daarnaast heeft de klant ook aangegeven dat deze graag aan meer security best practices wil voldoen die in de huidige versie nog niet zijn geïmplementeerd. Samen met de consultant heeft de klant het volgende opgesteld:
- De webserver moet niet meer “naakt” op het internet te benaderen zijn. Het liefst ziet de klant dat er een proxy tussen komt. Ook zal de server geen publiek IP adres meer moeten hebben.
- Mocht een gebruiker via HTTP verbinding maken met de load balancer dan zou deze verbinding automatisch geüpgraded moeten worden naar HTTPS.
- Hierbij moet de verbinding beveiligd zijn met minimaal TLS 1.2 of hoger.
De webserver moet met enige regelmaat een ‘health check’ ondergaan.
- Mocht de webserver deze health check falen dan zou de server automatisch hersteld moeten worden.
- Mocht de webserver onder aanhoudende belasting komen te staan, dan zou er een tijdelijke extra server opgestart moeten worden. De klant denkt dat er nooit meer dan 3 servers totaal nodig zijn gezien de gebruikersaantallen in het verleden.

*Note: Omdat we niet voor iedereen een domeinnaam willen aanschaffen, is het lastig om op de juiste manier een HTTPS-verbinding tot stand te brengen. Je mag hiervoor een self-signed certificate gebruiken. Je krijgt dan wel een waarschuwing in je browser, maar de verbinding wordt wel versleuteld.*

### Deliverables:

- Geupdate versie van de volgende documenten:
    - Architectuurtekening
    - De onderbouwing van de nieuwe gebruikte diensten in het ontwerpdocument
    - Een MVP van 1.1

- Doorgaand:
    - Time logs
    - Tussentijdse presentatie
    - De eindpresentatie

### User Stories

-----

**Als klant willen we dat de webserver beter word beveiligd**

**Epic:** V1.1

**Beschrijving:** 
- De webserver moet niet meer “naakt” op het internet te benaderen zijn. Het liefst ziet de klant dat er een proxy tussen komt. Ook zal de server geen publiek IP adres meer moeten hebben.

- Mocht een gebruiker via HTTP verbinding maken met de load balancer dan zou deze verbinding automatisch geüpgraded moeten worden naar HTTPS.

- Hierbij moet de verbinding beveiligd zijn met minimaal TLS 1.2 of hoger.


**Deliverable:** Werkende code voor een Webserver met betere beveiliging (bovenstaande vereiste).

---

**Als klant willen we dat de webserver gezond blijft**

**Epic**: V1.1

**Beschrijving**: 

- De webserver moet met enige regelmaat een ‘health check’ ondergaan.

- Mocht de webserver deze health check falen dan zou de server automatisch hersteld moeten worden.


**Deliverable**: Voorzie webserver van Health Check en fail safe.

---

**Als klant willen we een oplossing voor als de webserver overbelast raakt**

**Epic**: V1.1

**Beschrijving**: Mocht de webserver onder aanhoudende belasting komen te staan, dan zou er een tijdelijke extra server opgestart moeten worden. De klant denkt dat er nooit meer dan 3 servers totaal nodig zijn gezien de gebruikersaantallen in het verleden.

---
 



