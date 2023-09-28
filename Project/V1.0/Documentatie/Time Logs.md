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

---

# **Log 15-09-2023**

## Dagverslag (1 zin)
Presentation day.. Everything was well prepared except the fact that apparently i save things in a different format on my computer.

### Obstakels
[WinError 193] %1 is not a valid Win32 application

### Learnings
Probeer echt niks aan toeval over te laten. Zeker op belangrijke momenten als een product oplevering.

---

# **Log 18-09-2023**

## Dagverslag (1 zin)
Did research on the error (WinError193) and worked on my soft skill presentation

### Obstakels
I need to borrow a laptop from school to be able to test the solutions for the error.

### Learnings
Learnt a lot about assertiveness for either professional and personal use.

# **Log 19-09-2023**

## Dagverslag (1 zin)
Started on documentation and made design choices for V1.1. Also worked on presentation.

### Obstakels
- When keeping cost in mind it is harder to make choices

### Learnings
- Use Cost Calculator

---
# **Log 20-09-2023**

## Dagverslag (1 zin)
In the morning i prepped for presentation and had dentist appointment. Afternoon took care of some personal stuff and tried to fill in the Cost Calculator tool in the portal.

### Obstakels
Other than nerves for presenting not really

### Learnings
- Practice lines more often

---

# **Log 21-09-2023**

## Dagverslag (1 zin)
Got laptop to test some things for presenting. Started working on V1.1, app gateway almost done, beside the ssl certs.

### Obstakels
Getting OpenSSL installed for windows. Finding the right templates for the task.

### Learnings
Ask earlier, a peer had a way around it.

---

# **Log 22-09-2023**

## Dagverslag (1 zin)
ScaleSet and Application gateway build and rebuild. At the end of the got the file error free, got 3 error with deployment.

### Obstakels
- storage account: Code: KeyVaultAuthenticationFailure
- admin-vm: 

        {"code":"DeploymentFailed","target":"/subscriptions/0da605a2-710e-4e87-bf32-a7eb762a555c/resourceGroups/rg-project-v11/providers/Microsoft.Resources/deployments/admin-vm","message":"At least one resource deployment operation failed. Please list deployment operations for details. Please see https://aka.ms/arm-deployment-operations for usage details.","details":[{"code":"LinkedInvalidPropertyId","message":"Property id 'sub-management' at path 'properties.ipConfigurations[0].properties.subnet.id' is invalid. Expect fully qualified resource Id that start with '/subscriptions/{subscriptionId}' or '/providers/{resourceProviderNamespace}/'."}]}

- webVM: 

        {"code":"DeploymentFailed","target":"/subscriptions/0da605a2-710e-4e87-bf32-a7eb762a555c/resourceGroups/rg-project-v11/providers/Microsoft.Resources/deployments/webVM","message":"At least one resource deployment operation failed. Please list deployment operations for details. Please see https://aka.ms/arm-deployment-operations for usage details.","details":[{"code":"InvalidTemplate","message":"Unable to process template language expressions for resource '/subscriptions/0da605a2-710e-4e87-bf32-a7eb762a555c/resourceGroups/rg-project-v11/providers/Microsoft.Network/applicationGateways/webScaleSetappGw' at line '1' and column '8443'. 'Unable to evaluate template language function 'resourceId': the type 'Microsoft.Network/applicationGateways/httpListeners' requires '2' resource name argument(s). Please see https://aka.ms/arm-resource-functions/#resourceid for usage details.'","additionalInfo":[{"type":"TemplateViolation","info":{"lineNumber":1,"linePosition":8443,"path":""}}]}]}

### Learnings
- Code samenvoegen heeft me veel geleerd vandaag.

---

# **Log 25-09-2023**

## Dagverslag (1 zin)
Continued working on the errors i had last Friday. Fixed them and got a whole lot more in return. Feels like i am correcting typo's all day..

### Obstakels
Concentration, i am reading sentences 3 times today.

### Learnings
Step away in time or leave it for another day (if possible, today this was the case). 

---

# **Log 26-09-2023**

## Dagverslag (1 zin)
After a good night rest, ready to tackle some more errors today! Fixed a lot, almost there i feel like

### Obstakels
- the how and where regarding ssh keys.
- Authentication error with storage to keyVault
- VM requests ssh access, with key 
- When loading text use loadTextContent not loadFileAsBase64 (like I used for the custom data)
- (Code: BadRequest) with Key Vault deployment
- Scale set en App Gateway need to be on different subnets

### Learnings
- Make names more clear, easy to read. This makes it easier for me to differentiate in outputs
- Take more (regular) breaks so you read texts better.

---

# **Log 27-09-2023**

## Dagverslag (1 zin)
All day KeyVaultAuthenticationFailure, at the end of the day i decided to build a new storage account tomorrow.

### Obstakels
         {"status":"Failed","error":{"code":"DeploymentFailed","target":"/subscriptions/0da605a2-710e-4e87-bf32-a7eb762a555c/providers/Microsoft.Resources/deployments/main","message":"At least one resource deployment operation failed. Please list deployment operations for details. Please see https://aka.ms/arm-deployment-operations for usage details.","details":[{"code":"ResourceDeploymentFailure","target":"/subscriptions/0da605a2-710e-4e87-bf32-a7eb762a555c/resourceGroups/project-v11/providers/Microsoft.Resources/deployments/storageaccount","message":"The resource write operation failed to complete successfully, because it reached terminal provisioning state 'Failed'.","details":[{"code":"DeploymentFailed","target":"/subscriptions/0da605a2-710e-4e87-bf32-a7eb762a555c/resourceGroups/project-v11/providers/Microsoft.Resources/deployments/storageaccount","message":"At least one resource deployment operation failed. Please list deployment operations for details. Please see https://aka.ms/arm-deployment-operations for usage details.","details":[{"code":"KeyVaultAuthenticationFailure","message":"The operation failed because of authentication issue on the keyvault."}]}]}]}}

### Learnings

Niet te lang dood staren op iets, er zijn andere mogelijkheden.

---

# **Log 28-09-2023**

## Dagverslag (1 zin)
Rebuild my storage account with other encryption than using the key vault. Test if i have all the requested features.