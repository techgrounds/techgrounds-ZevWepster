**SEC-07 - Passwords**
===
**Key-terms**
---

**Hash:** Hash is a mathmethical function that puts strings into a seemingly random output. For example you have a password **"Cookies123"** the hash is (its not this is pure hypothetical) **4564514vs654dsf** and it always will be. But if you change your password you will get a completly new hash. Hash if often seen as a form of one way encryption, password --> hash, because you, almost, cannot work it out backwards, hash --> password. 

**Rainbow table:** a rainbow table is a precomputed table for reversing cryptographic hash functions, usually for cracking passwords. There are 2 ways of doing this:

- Dictionary attack: Attempting to find the original plain text by hashing common passwords (A LOT) and comparing them to the target hash

- Bruteforce attack: Trying every possible combination of characters against the hashed password. Time taken increases exponentially as password length and keyspace increases.

**Salts:** Salts are short random set of characters that are appended to the end of a users password before they are hashed. So the password "Cookies123" will be stored as "Cookies123"Y*U% or in hash 4564514vs654dsf,Y*U% in plain text.

**Opdracht**
---

- Find out what hashing is and why it is preferred over symmetric encryption for storing passwords.

- Find out how a Rainbow Table can be used to crack hashed passwords.

- Below are two MD5 password hashes. One is a weak password, the other is a string of 16 randomly generated characters. Try to look up both hashes in a Rainbow Table.

        03F6D7D1D9AAE7160C05F71CE485AD31 --> welldone!

        03D086C9B98F90D628F2D1BD84CFA6CA --> Not found.

- Create a new user in Linux with the password 12345. Look up the hash in a Rainbow Table.

- Despite the bad password, and the fact that Linux uses common hashing algorithms, you won’t get a match in the Rainbow Table. This is because the password is salted. To understand how salting works, find a peer who has the same password in /etc/shadow, and compare hashes.

        notzev hash: $6$qRABEw9bgJGU/WFS$jdpCNBBCFoz7VD3CkKnYMQAcEX5YUrKLqOclP3txEzeyo2v2MEGA/xifxkGfXm4IS4ezRA8uj2ulRl6xyggTZ1

        sinan hash: $6$YUCZcsZfVOA3cyvt$K0OXmhet0EJEYK929ORQK85NNZ6fskbcT4vvZsVUsvni7oIifEfm4bURxCEJj8aO8cE./.Q5Z2z6hm5fKKP2r0

Although there are similarities, the (random generated) salt makes sure the hash is different.

*Gebruikte bronnen*
---
[Hash generator](https://www.md5hashgenerator.com/)

[Crack station](https://crackstation.net/)

[Youtube](https://www.youtube.com/watch?v=--tnZMuoK3E&t=198s)



*Ervaren problemen*
---
geen ervaren problemen.


*Resultaat!*
---

