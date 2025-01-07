#set page(
  header: align(right)[
    _TCP/IP_
  ]
)

= TCP/IP

== #highlight[IP (Internet Protocol)]
- Pracuje na *síťové vrstvě* OSI (*L3*)
- Umožňuje posílání nezávislých *paketů* mezi zařízeními v rámci sítí
- Nezaručuje doručení nebo pořadí paketů


#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    #figure(image("../images/ipv4-header.png", width: 100%), caption: [IPv4 hlavička])
    == Fragmentace paketů
    - Je použita tehdy, když musí být paket odeslán přes linku, která má nížší velikost rámce než samotný paket
    - Paket může být fragmentován buď zdrojovým zařízením nebo jakýmkoliv routerem
    - Fragmenty jsou následně znovu sestaveny *cílovou stanicí*, přičemž mohou cestovat různými cestami
    - *Identification* - identifikuje fragmenty, které patří k původnímu paketu
    - *Fragment Offset* - určuje pozici fragmentu v původním paketu
  
  ],
  [],
  [
    == Protokoly podporující TCP/IP

    === #highlight[ARP (Address Resolution Protocol)]
    - Používá se k mapování *IP adresy* na *MAC adresu*
    - Když zařízení potřebuje zjistit MAC adresu pro danou IP adresu, vysílá *ARP požadavek*
    - ARP funguje mezi vrstvami *L2* a *L3*

    === #highlight[ICMP (Internet Control Message Protocol)]
    - Slouží pro *kontrolní* a *informační zprávy* mezi zařízeními
    - Zprávy ICMP jsou přenášeny v datové části IP paketů
    - ICMP zprávy:
      - *Echo request/Echo reply* - používá se pro testování dosažitelnosti zařízení (např. *ping*)
      - *Destination unreachable* - oznámení, že cílový hostitel nebo síť není dostupná
      - *Time Exceeded* - když *TTL = 0* nebo dojde k vypršení časového limitu při sestavování fragmentů
      - *Redirect*

    === #highlight[Traceroute]
    - Slouží k *detekci všech směrovačů* (routerů) na cestě k cílové síti
    - Využívá *TTL*, která se postupně *zvyšuje*
    - Když TTL vyprší, směrovač pošle zpět *ICMP Time Exceeded zprávu*
  ],
)

#pagebreak()

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == #highlight[TCP (Transmission Control Protocol)]
    - *Spolehlivý přenos dat* - všechny pakety, které byly odeslány, *budou doručeny* a ve *správném pořadí*
    - Využívá *three-way handshake* pro spolehlivé navázání spojení a jeho ukončení 
    - Data, která mají být odeslána, jsou rozdělena do *segmentů*
    - Každý segment je odeslán jako *samostatný* *paket* s vlastní hlavičkou
    - Využívá *Sliding Window* algoritmu (*Go-Back-N*) pro řízení toku, tento algoritmus zahrnuje zaslání více segmentů *bez čekání* na potvrzení každého z nich.
      - TCP používá potvrzení pro každý přijatý segment - pokud přijímač obdrží segment správně, posílá zpět potvrzení (*ACK*) o jeho přijetí
      - Implementuje řízení toku pomocí inzerování aktuální kapacity přijímacího bufferu. Odesílací strana se přizpůsobí velikosti okna, které přijímací strana nabízí, aby se zabránilo zahlcení přijímače
    - Pracuje na *L4*
    - Spojení se uzavírá z obou stran zvlášť (*FIN* + *ACK*)
    - *RST* donutí ukončení spojení v obou směrech

    === Three-way a four-way handshake
    #figure(image("../images/tcp-2.png", width: 100%))
  ], [],
  [
    === TCP hlavička
    #figure(image("../images/tcp.png", width: 100%))
    *Nejdůležitější prvky TCP hlavičky:*
    - Source a destination port
    - Acknowledgement number
    - Checksum
    - Bitové příznaky


    == #highlight[UDP (User Datagram Protocol)]
    - *Nepotvrzený* a *nespolehlivý* doručovací protokol, nemáme záruku že budou doručeny ve správném pořadí, ani že budou vůbec doručeny
    - Podporuje *broadcast* a *multicast*
    - Odesílatel a přijemce jsou identifikování pomocí *IP adresy* a *portu*
    - *Checksum* (*volitelný*) - kontrolní součet chrání data před chybami přenosu
    - Pracuje na *L4*

    #image("../images/udp.png", width: 100%)



    - *Source port* = port odesílatele
    - *Destination port* = port příjemce
    - *Length* = délka UDP hlavičky
    - *Checksum* - chybový součet, nepovinný
  
  ]
)





