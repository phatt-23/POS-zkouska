#set page(
  header: align(right)[
    _LAN, WAN a topologie_
  ]
)

= LAN, WAN a topologie // 🖥️

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == 1. LAN (Local Area Network)
    - *Místní síť*, často na *jednom* fyzickém místě (např. v jedné budově)
    - Má vysoké přenosové rychlosti (Mbps až Gbps)
    - Na médium se přenáší vždy *jen jeden paket* najednou

    === Typické topologie:

    - #highlight[*Hvězda*]
    - #highlight[*Sběrnicová (bus)*]
    - #highlight[*Strom (propojené hvězdy)*]
  ],
  [],
  [
    == 2. WAN (Wide Area Network)
    - *Širokopásmová* síť, která propojuje zařízení 
      na *větší* vzdálenosti (např. mezi městy, zeměmi)
    - *Nižší přenosové rychlosti* (běžně kbps, ale moderní WAN i Gbps)
    - Na médium může být současně přenášeno *více* paketů

    === Typické topologie:
    - #highlight[*Síť (mesh)*]
    - #highlight[*Hvězda s centrálním uzlem*]
  ]
)

== Síťové topologie

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    === #highlight[Sběrnicová topologie (Bus)]
    - Všechna zařízení jsou připojena ke *společnému kabelu* (sběrnici)
    - Nízké náklady, ale omezená bezpečnost a odolnost vůči selhání
    - Vhodná pro malé sítě, ale obtížná na údržbu

    #figure(image("../images/image (8).png", width: 40%))

    === #highlight[Hvězdicová topologie (Star)]
    - Každé zařízení je připojeno k *centrálnímu uzlu* (např. hub nebo switch)
    - Odolná vůči selhání jednotlivých zařízení, ale pokud selže centrální uzel, celá síť přestane fungovat
    - Je to nejčastější topologie v *LAN* sítích
    #figure(image("../images/image (9).png", width: 30%))

    === #highlight[Příklad topologie internetu]
    - Internet kombinuje různé topologie *LAN* a *WAN* a propojuje je přes *routery*
    - Každá menší síť v internetu může mít *vlastní topologii*
  ],
  [],
  [
    === #highlight[Stromová topologie (Tree)]
    - Rozšířená hvězdicová topologie s hierarchickým uspořádáním (větve)
    - Flexibilní a rozšiřitelná, často používaná v moderních *LAN*
    #figure(image("../images/image (10).png", width: 50%))

    === #highlight[Kruhová topologie (Ring)]
    - Zařízení jsou propojena v kruhu a každé zařízení posílá data jen jednomu sousednímu zařízení
    - Citlivá na výpadky
    #figure(image("../images/image (11).png", width: 30%))

    === #highlight[Mesh (síťová topologie)]
    - Přímé propojení mezi zařízeními (často mezi routery v *WAN*)

    #figure(image("../images/image (12).png", width: 40%))

  ]
)

