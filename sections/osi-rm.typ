#set page(
  header: align(right)[
    _OSI model_
  ]
)
= OSI model

- Definuje, jak různé systémy komunikují v síťovém prostředí
- Model rozděluje tuto komunikaci do *sedmi vrstev*, z nichž každá má specifické funkce a význam
=== Dělí se na:
- *Connection-Oriented Communication* - spojení je navázáno přenosem dat a ukončeno po skončení přenosu, data jsou ve správném pořadí a je spolehlivý (např. *TCP*)
- *Connectionless Communication* - data se odesílají bez předchozího navázání spojení, každý paket je nezávislý a může dorazit ve špatném pořadí (např. *UDP*)

== Enkapsulace a dekapsulace
- Data procházejí jednotlivými vrstvami OSI modelu
- Každý vrstva přidá *své vlastní informace* k těmto datům (hlavičky, patičky apod.)
- Tyto informace pomáhají při přenosu dat na cílové zařízení
- Na opačné straně nastává *dekapsulace*, kdy každá vrstva přijme data, *odstraní svoji hlavičku* a předá data vrstvě výše

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == 1. #highlight[Fyzická vrstva (Physical)]
    - Zajišťuje přenos jednotlivých *bitů* mezi zařízeními
    - Definuje fyzické aspekty, jako jsou *kabely*, *konektory*, *signály* a *rychlosti*
    - Příklady: *Ethernet*, *Wi-Fi*, *Bluetooth*, USB

    == 2. #highlight[Linková vrstva (Data Link)]
    - Poskytuje logické spojení mezi sousedními uzly
    - Zajišťuje formátování *rámců* (frames), adresování pomocí *MAC adres*, detekci chyb a řízení toku
    - Příklady: LLC 802.2, PPP, Frame Relay 

    == 3. #highlight[Síťová vrstva (Network)]
    - Umožňuje směrování *paketů* mezi nesousedními uzly a zajišťuje adresování zařízení v rámci celé sítě
    - Zajišťuje *přenos* mezi *různými* sítěmi
    - Příklady: *IP*, *ICMP*, *IPsec*

    #figure(image("../images/osi.png", width: 81%), caption: [OSI-RM model])
  ],
  [],
  [
    == 4. #highlight[Transportní vrstva (Transport)]
    - Zajišťuje *spolehlivý* nebo *nespolehlivý* přenos dat mezi zařízeními, spravuje více spojení současně
    - Segmentuje a skládá data zpět, zajišťuje řízení toku a korekci chyb
    - Příklady: *TCP* (*spolehlivý*), *UDP* (*nespolehlivý*)

    == 5. #highlight[Relační vrstva (Session)]
    - Řídí a synchronizuje dialog mezi aplikacemi na různých systémech
    - Umožňuje *simplex*, *duplex* nebo *half-duplex* přenosy a kontroluje přenosy důležitých dat
    - Příklady: Remote Procedure Call (RPC)

    == 6. #highlight[Prezentační vrstva (Presentation)]
    - Starost o *překódování* dat do *správného formátu*, jako je převod znaků nebo komprese a šifrování
    - Příklady: *ASCII*, *JPEG*, *TLS*

    == 7. #highlight[Aplikační vrstva (Application)]
    - Poskytuje přístup k síťovým službám pro *aplikace* a uživatele
    - Zajišťuje komunikaci mezi aplikacemi (např. *e-mail*, *web*, *souborový přenos*)
    - Příklady: *HTTP*, *FTP*, *SMTP*, *IMAP*, *SMTP*, *POP3*, *SSH*

  ],
)


