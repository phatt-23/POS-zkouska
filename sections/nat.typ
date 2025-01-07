#set page(
  header: align(right)[
    _NAT_
  ]
)
= NAT

- Slouží k překladu *soukromých* adres na *veřejné*
- Stanice si mohou dynamicky půjčovat veřejné IP adresy nebo vystupovat pod jednou veřejnou IP adresou
- Omezuje potřebu mít velké množství veřejných IP adres

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == #highlight[Statický NAT]
    - Předem nakonfigurované záznamy pro překlad
    - Ke každé soukromé adrese přiřadíme *jednu veřejnou*
    - Při použití statického NAT lze provozovat servery v privátní síti, které budou přístupné z internetu
  ],
  [],
  [
    == #highlight[Dynamický NAT]
    - Router půjčuje volné veřejné IP adresy z *poolu*
    - Vytvoří si záznam v tabulce pro mapování mezi soukromou a veřejnou adresou
    - Po obdržení odpovědi přeloží adresu *zpět* na původní soukromou adresu
  ]
)

=== Nevýhody NAT:
- Pokud je NAT zařízení za více routery, může být příchozí provoz doručen přes nesprávnou cestu.
