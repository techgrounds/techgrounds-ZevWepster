# Time Logs Project V1.0



# **Log 21-08-2023**


## Dagverslag (1 zin)

Today I took the time to read the document and write down questions to discuss with my team so the scrum master can discuss this with the Project Owner.


### Obstakels

- Where to start.
- What do I need to actually make this project happen.


### Oplossingen

- Read the documentation multiple times and discuss with peers.
- Create a list with services you might need to get a better understanding of where to start.
- Visualize the project using [Miro - Mind Maps](https://miro.com)

### Learnings

- It is important to really know what the client wants
- dissecting a problem really helps with overview
---
# **Log 22-08-2023**


## Dagverslag (1 zin)

Used today to figure out if things work (individually) the way I think they will (trough the Portal), made appointment with Product Owner and made documentation ready for the future.

### Obstakels

- VM takes very long to deploy
- What to do when things do not work as intended
- No plan of action

### Oplossingen

- Change the Resource Group
- Ask, ask, ask 
- Dissect and write down the things asked in Jira (a project management planner)

### Learnings
- Resource Crunching
- Writing things down in a schematic way gives more clarity
---
# **Log 23-08-2023**

## Dagverslag (1 zin)
Na afspraak met Product Owner heb ik het meeste van de opzet voor de documentatie geschreven, eerste opmaak gemaakt voor alle te gebruiken diensten en daar de besluitvorming opgeschreven.

### Obstakels
- Keuzes en afwegingen

### Oplossingen
- Overleggen met peers en uitzoeken wat eventuele pros en cons zijn van de gemaakte keus.

### Learnings 

Vandaag soft skills presentatie gehad over solution oriented mindset en heb dat kunnen toe passen vandaag door niet te lang bij het probleem (waarom diensten wel of niet zouden kunnen werken) stil te staan maar uitzoeken hoe ik dit kon oplossen.

---

# **Log 24-08-2023**


## Dagverslag (1 zin)
Eerste elementen gecodeerd, Ik heb een Bicep script geschreven waarmee ik automatisch deploy:
- resource group
- storage account
- 2 Vnets met toegewezen ip adressen in de subnets.

### Obstakels
- uitvinden waarom de resource group en storage account niet tegelijk willen deployen


### Oplossingen
- voeg scope toe aan modules of te deployen resource, main.bicep staat op subscription in gesteld.

### Learnings
- volgorde van deployen en het belang hiervan.
---

# **Log 25-08-2023**


## Dagverslag (1 zin)
Ik schrijf dit een week later, ik ben die dag bezig geweest met het deployen van mijn VMs, einde van de dag was dit nog niet gelukt

### Obstakels
Mijn params waren all over the place en linkte niet goed met elkaar en/of er was geen output.

### Oplossingen
Ik heb veel van mijn code gereorganiseerd (zie volgend dag verslag)

### Learnings
documenteren wat je doet, dit kan helpen het overzichtelijker te houden.

---


---
# **Log 05-09-2023**


## Dagverslag (1 zin)
Veel code herschreven/ gereorganiseerd, aan keyVault module gewerkt.

### Obstakels
veel params stonden er over dubbel in of linkte naar het onjuiste. 
KeyVault net niet werkend gekregen, ik had niet juiste object id.

### Oplossingen
uitvinden welke er wel en niet in de main file nodig zijn om de module te schrijven en laten werken in main file

### Learnings

---

# **Log 06-09-2023**


## Dagverslag (1 zin)
een begin aan de key vault en templates gezocht voor webserverVM en eerste deel geschreven.

### Obstakels
1. key vault module samen laten werken met managed identity


### Oplossingen
1. ik kreeg de vault wel gedeployed maar heb nog niet uit gevonden hoe verder, morgen weer een nieuwe dag.

### Learnings
Github templates in combinatie met de decompile functie van dingen die ik gebouwd heb in de portal maakte veel duidelijk en snapte hierdoor ook de json files beter waardoor ik de stukken 
---

# **Log 07-09-2023**


## Dagverslag (1 zin)
webserver werkend gekregen,, managed identity is gelinkt aan de webserver met een geheim, key vault encryptie met storage account werkt

### Obstakels
1. storage account en container mogen geen hoofdletters hebben in naam
2. param en var verkeerd gebruiken

### Oplossingen
1. naam veranderen.
2. een van mijn peers wist dit eenvoudig uit te leggen.

### Learnings

---

# **Log 08-09-2023**


## Dagverslag (1 zin)
encrypted storage account werkend gekregen en de back up policy werkend gekregen.

### Obstakels
1. KeyVaultPolicyError --> BadRequest 400 --> Key Vault policy recoverable is not set.

### Oplossingen
1. set Purge Protection to 'true' to solve this. This makes it you can not hard delete your vault without permission

### Learnings
Niet alle requirements komen automatisch naar boven in de VScode bicep bestanden. Dit word achteraf wel alsnog aangegeven.

---

# **Log 11-09-2023**


## Dagverslag (1 zin)
Deliverable check and working on documentation for the user manual and figuring out how to connect
### Obstakels
1. got a error with deleting and redeploying the recovery service vault (soft delete)
2. got a error with the key vault, name already used.
3. was not able to connect to web server in the intended way

### Oplossingen
1. beide instellingen voor soft delete veranderen en backup stoppen en deleten in de portal.
2. andere naam aan key vault geven.
3. RDP is niet (moeilijk) mogelijk voor een Linux server. nsg regels veranderd naar toegang met poorten 22 ipv 3389

### Learnings
zorg dat alles op de juiste manier gedeletet word zodat ik dit weer kan deployen tijdens de presentatie

---

# **Log 12-09-2023**

## Dagverslag (1 zin)
wrote user manual.

### Obstakels
Nothing today

### Learnings
Ik moet beter opschrijven wat ik doe, tijdens het doen, om het schrijven van documentatie.

---

# **Log 13-09-2023**

## Dagverslag (1 zin)
checked if i have everything to do my presentation of v1.0 next Friday and started working on the presentation.

### Obstakels
Nothing today

### Learnings
The (softskill)presentations last and this week really helped me with taking a approach. 

---

# **Log 14-09-2023**

## Dagverslag (1 zin)
Worked on presentation all day.

### Obstakels
Nothing today

### Learnings
I got this!