# Decisions made during my project

**21-08-23:** Took the time to read the document to get a good understanding of what is asked.

**22-08-23:** testing parts individually trough the portal to make sure my ideas work as intended.

**23-08-23:** After meeting with the Product Owner i had a (more) complete picture of what is needed and was able to make a first draft for all the services i wanted to use to make the requirements.

# First draft

## Deliverable: IaC-code voor het netwerk en alle onderdelen

- 2 Virtual Networks, 
	- webserver-vnet: 10.10.10.0/24
   	- management-vnet: 10.20.20.0/24
- Connection between the two VNet's trough Peering.

## Deliverable: IaC-code voor een webserver en alle benodigdheden

- Virtual Machine (webServer-VM) that will get launched automatically with a Apache web server
- a NSG with the following rules applied:
	
    | Inbound | Outbound |
    |---| ---| 
    | Allow SSH only from Admin server | Allow HTTPS (443)
    | Allow HTTPS (443) |

## Deliverable: IaC-code voor een Admin/Management server met alle benodigdheden

- Virtual Machine (managementServer-VM)
- a NSG with the following rules applied:

| Inbound | Outbound |
|---| ---| 
| Allow RDP (3389) for "Office"-IP | Deny all outbound (80, 443)
| Deny all other inbound | 

## Deliverable: IaC-code voor een opslag oplossing voor scripts

- Storage account (Blob storage)

## Deliverable: IaC-code voor versleuteling voorzieningen

- Key vault


## Deliverable: IaC-code voor backup voorzieningen

- Azure Back up center met Recovery Service Vault

**05-09-2023**: I chose to rewrite and reorganize part of my code since i had been gone for a week and the code did not make many sense anymore

**06-09-2023**: for deploy and testing purposes i decided to connect via username and password.

---
---
# V1.1


**19-09-2023**: I forgot to write down any decisions i made for v1.0 and just went with it, did not really defer from my original plan described above. Today i am starting with version 1.1 and will try to keep this more updated.

Changes to be made for V1.1 are:

- Adminserver: 
    - ssh access to webserver

- Webserver:
    - Proxy --> Application Gateway
    - No Public IP
    - HTTPS connection with self signed certificate
    - Health Check --> probe? in load balancer
    - Automatic recovery -->
    - Scale set (max 3 vms needed)

- Storage:
    - SQL server for postDeploymentScripts (placeholder only)

After spending a good portion of the day figuring out what is needed for V1.1 this is where I will be focusing on, for now.

**26-09-2023**: after fixing a lot of errors I decided to make a small overview of how its going and what still needs to be done.

- Adminserver: 
    - ssh access to webserver // webserver (scale set) is not deploying yet

- Webserver:
    - Proxy --> Application Gateway // works/ deploys
    - No Public IP // fixed
    - HTTPS connection with self signed certificate // works
        - Http upgrade to https // still needs test
    - Health Check --> extension on scale set // yet to test
    - Automatic recovery --> scale set // no error (yet)
    - Scale set (max 3 vms needed) // deploys
        - stress test

- Storage:
    - SQL server for postDeploymentScripts (placeholder only) // not started

**27-09-2023**: to summarize after some more testing, I still need to:
- https convert // done-works (28-09)
- Stress test //
- check for no public ip // checked - done
- ssh access // 

**28-09-2023**
Rebuild storage account. Everything deploys now without errors. 

Check list for correct configuration:

- Adminserver: 
    - ssh access to webserver // **Works**

- Webserver:
    - Proxy --> Application Gateway // **Works**
    - No Public IP // **not on vm only app gateway**
    - HTTPS connection with self signed certificate // **Works with password**
    - Health Check --> // **Works, 3 instances healthy when deployed**
    - Automatic recovery --> // **Enabled**
    - Scale set (max 3 vms needed) // **Works** // stresstest for upscale yet to be tested.

- Storage:
    - Storage Account with blob container for storing scripts // **Works** 
    - SQL server for postDeploymentScripts (placeholder only) // not started yet
