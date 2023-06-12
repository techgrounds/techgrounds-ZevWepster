**NTW-01 OSI Stack**
===

**Key-terms**
---

**OSI model:** Open  Systems interconnection is model primarily used for troubleshooting of telecommunication. This model has 7 layers.

**The TCP/IP model:** This is an alternative to the OSI model. This model describes the standard on wich the internet was built, so it's a more realistic model. This model had 4 layers.

*The TCP/IP stack:* 

- **Layer 1: Application layer:** This is the topmost layer wich indicates the applications and programs that utilize the TCP/IP model for communicating with the user trough applications and varios tasks performed by the layer, including data representation for the applications executed by the user and forwards it to the transport layer.

    The application layer maintains a smooth connection between the application and user for data exchange and offers various features as remote handling of the system, e-mail services, etc.

Some of the protocols used in this layer are:

    - HTTP: Hypertext transfer protocol is used for accessing the information available on the internet.
    - SMTP: Simple mail transfer protocol, assigned the task of handling e-mail-related steps and issues.
    - FTP: This is the standard protocol that oversees the transfer of files over the network channel.

- **Layer 2: Transport layer:** This layer is responsible for establishing the connection between the sender and the reciever device and also performs the task of dividing the data from the application layer into packets, wich are then used to create sequences.

    It also performs the task of maintaining the data, i.e., to be transmitted without error, and controls the data flow rate over the communication channel for smooth transmission of data.

    The protocols used in this layer are:

        - TCP: Transmission Control Protocol is responsible for the proper transmission of segments over the communication channel. It also establishes a network connection between the source and destination system.

        - UDP: User Datagram Protocol is responsible for identifying errors, and other tasks during the transmission of information. UDP maintains various fields for data transmission such as:

            - Source Port Address: This port is responsible for designing the application that makes up the message to be transmitted.

            - Destination Port Address: This port receives the message sent from the sender side.

            - Total Length: The total number of bytes of the user datagram.

            - Checksum: Used for error detection of the message at the destination side.

- **Layer 3: Internet layer:** The internet layer performs the task of controlling the transmission of the data over the network modes and enacts protocols related to the various steps related to the transmission of data over the channel, wich is in the form of packets sent by the previous layer (the transport layer).

    This layer performs many important functions in the TCP/IP model, some of wich are:

        - It is responsible for specifying the path that the data packets wil use for transmission.

        - It is responsible for providing IP addresses to the system for the identification matters over the network channel.

    Some of the protocols applied in this layer are:

        - IP: This protocol assigns your device with a unique address; the IP address is also responsible for routing the data over the communication channel.

        - ARP: This protocol refers to the Address Resolution Protocol that is responsible for finding the physical address using the IP address

- **Layer 4: Network acces layer:** This layer is the combination of data-link and physical layer, where it is responsible for maintaining the task of sending and recieving data in raw bits in binary format over the physical communication modes in the networking channel.


*The OSI Stack:* The OSI stack has 7 layers, each representing a different component of network communications. Each layer had different protocols associated with it.

- **Layer 1: Physical layer:** The physical layer transports data using electrical, mechanical or procedural interfaces. This layer is responsible for sending computers bits from one device to another along the network. It determines how physical connections to the network are set up and how bits are represented into predictable signals as trhey are transmitted either electriacally, optically or via radio waves.

- **Layer 2: The data-link layer:** The data-link or protocol layer in a program handles moving data into and out of a physical link in a network. This layer handles problems that occur as a result of bit transmission errors. It ensures that the pace of the data flow does not overwhelm the sending and recieving devices.

    The data-link layer can be devided in 2 sublayers:

            - The higher layer, which is called logical link control (LLC), is responsible for multiplexing, flow control, acknowledgement and notifying upper layers if transmit/receive (TX/RX) errors occur.

            - The media access control sublayer is responsible for tracking data frames using MAC addresses of the sending and receiving hardware. It's also responsible for organizing each frame, marking the starting and ending bits and organizing timing regarding when each frame can be sent along the physical layer medium.

- **Layer 3: The network layer:** The primary function of this layer is to move data into and trough other network. Network layer protocols accomplish this by packaging data with correct networ address information, selecting the approriate network routes and forwarding the packaged data up the stack to the transport layer. From a TCP/IP perspective, this is where IP addresses are applied for routing purposes.

- **Layer 4: The transport layer:** is responsible for transferring data across a network and provides error-checking mechanisms and data flow controls. It determines how much data to send, where it gets sent and at what rate. TCP within the TCP/IP suite is the best-known example of the transport layer. This is where the communications select TCP port numbers to categorize and organize data transmissions across a network.

- **Layer 5: The session layer:** sets up, coordinates and terminates conversations between applications. Its services include authentication and reconnection after an interruption. This layer determines how long a system will wait for another application to respond. Examples of session layer protocols include X.225 and Zone Information Protocol (ZIP).

- **Layer 6: The presentation layer:** translates or formats data for the application layer based on the semantics or syntax the application accepts. This layer also handles the encryption and decryption that the application layer requires.

- **Layer 7: The application layer:** enables the user -- human or software -- to interact with the application or network whenever the user elects to read messages, transfer files or perform other network-related tasks. Web browsers and other internet-connected apps, such as Outlook and Skype, use Layer 7 application protocols.



**Opdracht**
---
- Study the OSI model and its uses.
- Study the TCP/IP model and its uses.


*Gebruikte bronnen*

[TechTarget](https://www.techtarget.com/searchnetworking/definition/OSI)

[Simplilearn.com](https://www.simplilearn.com/tutorials/cyber-security-tutorial/what-is-tcp-ip-model#:~:text=TCP%2FIP%20allows%20computers%20on,the%20host%20to%20the%20host.)


*Ervaren problemen*

Voor alsnog geen ervaren problemen.



*Resultaat*



