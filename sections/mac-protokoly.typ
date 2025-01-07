#set page(
  header: align(right)[
    _Metody sdílení přenosového kanálu_
  ]
)

= Metody sdílení přenosového kanálu

- Umožňují *více* zařízením *sdílet* *jeden* komunikační kanál (např. kabel, bezdrátová frekvence jako Wi-Fi), aniž by docházelo k neustálým kolizím
- Tyto protokoly rozhodují, *které zařízení může vysílat data a kdy*

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == Nedeterministické protokoly (kolizní)
    - Používají *náhodné algortimy* pro přístup ke kanálu
    - O přístup na kanál se může pokusit více stanic současně #sym.arrow *kolize*
    - Jsou jednodušší na implementaci

    === 1. #highlight[Aloha]
    - Základní protokol, kde stanice vysílá bez kontroly, zda je kanál volný
    - Po kolizi stanice počká náhodný čas a zkusí to znovu
    - *Pure Aloha* - kolizní čas může být až dvojnásobkem časového úseku rámce
    - *Slotted Aloha* - vysílání začíná pouze v předem daných časových slotech, což snižuje pravděpodobnost kolize a zvyšuje efektivitu

    === 2. #highlight[CSMA (Carrier Sense Multiple Access)] 
    - Stanice "naslouchá" (sleduje kanál), jestli je volný, než začne vysílat
    - *1-persistent CSMA* - stanice čeká, dokud kanál není volný, a pak hned vysílá
    - *Non-persistent CSMA* - pokud je kanál obsazený, stanice počká náhodný čas a zkusí znovu
    - *p-persistent CSMA* - když je kanál volný, stanice vysílá s pravděpodobností $p$, jinak čeká na další časový slot

    === 3. #highlight[CSMA/CD (CSMA with Collision Detection)] 
    - Po kolizi stanice detekuje srážku a zastaví vysílání, aby šetřila kapacitu kanálu
    - *Ethernet je příkladem technologie, která tento protokol využívá*

    === 4. #highlight[CSMA/CA (CSMA with Collision Avoidance)] 
    - Využívá se v bezdrátové komunikaci (*802.11* - Wi-Fi)
  ],
  [],
  [
    == Deterministické protokoly (bezkolizní)

    === 1. #highlight[Centralizované řízení]
    - Jeden hlavní uzel (např. master stanice) řídí přístup ke kanálu pro ostatní uzly
    - *Polling* - hlavní uzel dotazuje stanice, zda chtějí vysílat
    - *Request Arbitration* - stanice žádají o přístup na odděleném kanálu a hlavní uzel rozhoduje o přidělení

    === 2.  #highlight[Distribuované řízení]
    - Každá stanice má možnost přístupu bez centrální kontroly, ale podle určitého algoritmu
    - Nezávislé na řídící stanici, složitější implementace
    - Příklady: Bit-Map Protocol, Binary Countdown, Adaptive Tree-Walk Protocol
      - Token passing
        - Ve stavu klidu, když žádný uzel nevyžaduje právo na vysílání, cyklicky putuje mezi uzly rámec *Token* (vysílací právo)
        - Počítač může začít vysílat pouze tehdy, *když získá tento Token*
      

  ],
)

