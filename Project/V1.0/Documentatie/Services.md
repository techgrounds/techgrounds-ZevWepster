# List of Services used

In this document I will go over the Services i will use for this project. I will make this list following the deliverables in the user stories. I will add and/ or remove services in this list when i see the need. For explanation i will refer to my  [decisions](Decisions.md) documentation.


## Deliverable: IaC-code voor het netwerk en alle onderdelen

- 2 Virtual Networks, 
	- webserver-vnet: 10.10.10.0/24
        Subnet: 10.10.10.0/26
   	- management-vnet: 10.20.20.0/24
        Subnet: 10.20.20.0/26
- Connection between the two VNet's trough Peering.

## Deliverable: IaC-code voor een webserver en alle benodigdheden

- Virtual Machine (webServer-VM) that will get launched automatically with a Apache web server
- a NSG with the following rules applied:
	- SSH or RDP 

## Deliverable: IaC-code voor een management server met alle benodigdheden

- Virtual Machine (managementServer-VM)
- a NSG with the following rules applied:
	- public access allow trough Public IP
	- only accessible for trusted locations

## Deliverable: IaC-code voor een opslag oplossing voor scripts

- Storage account (Blob storage)

## Deliverable: IaC-code voor versleuteling voorzieningen

- Key vault


## Deliverable: IaC-code voor backup voorzieningen

- Azure Back up center met Recovery Service Vault

## Deliverable: Documentation

### Exploration 
- [Assignments](Assignment.md)
- [Assumptions](../Assumptions.md)
- [Services (This Document)](Services.md)

### Development

- Design
- [Decisions](Decisions.md)
- [Time Logs](<Time Logs.md>)
- Configuration Manual
- [User Manual](user-manual.md)



