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