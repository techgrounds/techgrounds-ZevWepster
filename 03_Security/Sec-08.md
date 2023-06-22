**SEC-08 - Detection, response and analysis**
===
**Key-terms**
---

**IDS:** Intrusion Detection System. Detects possible intrusions.

**IPS:** Intrusion Prevention System. Tries to prevent any intrusions

**RPO:** Recovery Point Objective, how much data is lost on incident.

**RTO:** Recovery Time Objective, how long it takes to be back online.

**IR Plan:** Incident Response Plan, is a plan for how to handle a attack whenever you are getting attacked. The NIST Computer Security Incident Handling Guide (SP 800-61), the gold standard for guidance in this regard, specifies four areas that should be addressed in this plan:

- *Preparation:* Planning in advance how to handle and prevent security incidents.
- *Detection and analysis:* Encompasses everything from monitoring potential attack vectors to looking for signs of an incident, to prioritization
- *Containment, eradication and recovery:* Developing a containment strategy, identifying the hosts and systems under attack, migrating effects and having a plan for recovery.
- *Post-incident activity:* Reviewing lessons learned and having a plan for evidence retention

**Opdracht**
---
- A Company makes daily backups of their database. The database is automatically recovered when a failure happens using the most recent available backup. The recovery happens on a different physical machine than the original database, and the entire process takes about 15 minutes. What is the RPO of the database?

                Everything since the last back-up will be lost.

- An automatic failover to a backup web server has been configured for a website. Because the backup has to be powered on first and has to pull the newest version of the website from GitHub, the process takes about 8 minutes. What is the RTO of the website?

                About 8 minutes.



*Gebruikte bronnen*
---

[msp360](https://www.msp360.com/resources/blog/how-to-respond-to-cyberattacks/)

[Juniper](https://www.juniper.net/nl/nl/research-topics/what-is-ids-ips.html)

*Ervaren problemen*
---

geen ervaren problemen.

*Resultaat!*
---

