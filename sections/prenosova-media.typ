#set page(
  header: align(right)[
    _Přenosová média_
  ]
)

= Přenosová média 

=== Typy přenosových médií:
- #highlight[*Kovová média*] - koaxiální kabely a kroucená dvojlinka, běžné pro *LAN*
- #highlight[*Optická vlákna*] - velmi vysoké přenosové rychlosti, odolná vůči rušení
- #highlight[*Bezdrátová média*] - Wi-Fi, Bluetooth přenášejí data vzduchem

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == #highlight[Koaxiální kabely]
    - *Drahé* ale kvalitní
    - V minulosti se využívaly pro počítačové sítě, nyní se využívají pro kabelovou televizi
    - Podporují *Baseband* i *Broadband* přenos, ale jsou dražší než kroucená dvojlinka
    - Dosah několika set metrů až kilometrů




    == #highlight[Optická vlákna]
    - Optické vlákno přenáší data pomocí *světla*, což minimalizuje rušení a umožňuje *velmi vysoké rychlosti*
    - *Multimode* (vícevidová) - má širší jádro a využívá se na kratší vzdálenosti (např. v budovách)
    - *Singlemode* (jednovidová) - užší jádro, vhodné pro dlouhé vzdálenosti s vyšší přenosovou rychlostí

    === Hlavní výzvy optických vláken:

    - *Chromatická disperze* - různé frekvence světla se šíří různou rychlostí, což způsobuje zkreslení
    - *Modální disperze* - u multimode vláken vzniká zpoždění mezi různými světelnými paprsky, což omezuje rychlost
  ], 
  [],
  [
    == #highlight[Kroucená dvojlinka (Twisted Pair)]
    - Levnější než koaxiál a běžně používaná v *LAN*
    - Obsahuje *čtyři páry drátů*, často se stíněním pro ochranu proti elektromagnetickému rušení
    - Kategorie kabelů (*Cat3 až Cat8*) určují kvalitu a maximální rychlost přenosu
    - *Cat5e a vyšší podporují gigabitové přenosy*



    == #highlight[Strukturovaná kabeláž]
    - Obecné označení metalických a optických prvků, které umožní propojení jednotlivých uživatelů v rámci sítě
    - Strukturovaný kabelážní systém je univerzální a umožňuje propojení různých zařízení (telefony, LAN, alarmy)
    - Tento systém se instaluje do budov jako *trvalé řešení*, které je nezávislé na konkrétní síťové technologii
    - Je navrhována s ohledem na *budoucí rozšíření*
    - Kabeláž je ze zásuvek svedena do patch panelů v rozvaděčích
    - *Vertikální kabeláž* slouží k propojení jednotlivých pater budovy. Využívá optické kabely nebo kabely \ Cat5e a lepší
  ]
)

#v(2em)

#grid(
  columns: (1fr, 1fr, 1fr),
  [
    #figure(
      image("../images/image (5).png", width: 80%)
    )
  ],
  [
    #figure(
      image("../images/image (6).png", width: 80%)
    )
  ],
  [
    #figure(
      image("../images/image (7).png", width: 80%)
    )
  ]
)

