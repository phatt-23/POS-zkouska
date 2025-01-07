#set page(
  header: align(right)[
    _Směrovací algortimy_
  ]
)

= Směrovací algortimy // 🚦

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == 1. Sítě s přepínáním okruhů
    - Starší technologie (vyvinuta z telefonních sítí)
    - Uzel musí požádat síť o vytvoření okruhu pro komunikaci s partnerem a jeho následné zrušení
    - Zaručuje stabilní a prediktabilní kvalitu služby, ale není efektivní
    - Příklad: *tradiční telefonní sítě*
  ],
  [],
  [
    == 2. Sítě s přepínáním paketů
    - Byly vyvinuty v rámci vojenského projektu ARPA 
    - *Tvoří základ dnešního internetu*
    - Data se přenášejí *"hop-by-hop"* (mezi routery) přes polygonální strukturu
    - Data jsou rozdělena do *paketů*, které jsou přenášeny nezávisle na sobě
    - Pakety mohou dorazit v nesprávném pořadí nebo mohou být zdvojené
  ],
)

== Virtuální kanál
- *Kompromis* mezi přepínáním okruhů a paketů
- Vytváří a ruší se na *žádost* uživatele
- Cesta je přes síť nalezena pouze při *vytváření* virtuálního kanálu
- Pakety nemohou dorazit v nesprávném pořadí protože putují *stejnou cestou*

#v(2em)

== Směrovací algortimy

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    - Součást softwaru *3. vrstvy* OSI modelu, který rozhoduje, na jakém rozhraní bude přijatý paket odeslán
    - Rozhodnutí jsou provedena na základě *směrovacího protokolu*, nebo *informací zadaných ručně*
    - Využívají *směrovací tabulku*

    === #highlight[Směrovací tabulka]

    - Uchovává záznamy ve formátu:
    - `<Destinace (síť + maska)> <Výstupní rozhraní/následující uzel> <metrika>`
    - *Všechny záznamy* ve směrovací tabulce se musí zkontrolovat pro *každý* paket #sym.arrow *časově náročný proces*

    === #highlight[Default gateway] (výchozí cesta)
    - Všechny pakety, které neodpovídají žádnému záznamu ve směrovací tabulce, jsou směrovány na tuto *výchozí cestu*
    - Označena jako `0.0.0.0/0 `

    === Směrovací protokoly se dělí na:

    - #highlight[*Distance vector*] - starší, jednoduší implementace
    - #highlight[*Link state*] - komplexnější implementace

  ],
  [],
  [
    == #highlight[Distance vector (DVA)]
    - Routery *neumí topologii sítě*, *umí pouze cesty do dalších routerů a ví o délce*
    - Směrovací tabulka obsahuje pouze sítě, které jsou *přímo* připojené na router
    - Směrovací tabulka je *pravidelně zasílána* broadcastem sousedním routerům
    - Pokud nějaká cesta selže, je *odstraněna* ze směrovací tabulky
    - Využívají *hop-count* jako metriku pro výpočet cesty, *maximum je 16* pro RIP
    - *Pomalu konvergují*
    - Příklad: *RIP*

    == #highlight[Link state (LSA)]
    - Routery *umí topologii celé sítě* a *cenu jednolivých hran*
    - Tyto informace si ukládají v databázi, každý router ji má *stejnou*
    - *Každý router si vypočte nejkratší cestu do všech ostatních routerů*
    - Příklad: *OSPF* (Využívá *Dijkstrův* algoritmus)
  ],
)








