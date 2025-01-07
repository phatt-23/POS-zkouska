#set page(
  header: align(right)[
    _Základy bezpečnosti sítí_
  ]
)

= Základy bezpečnosti sítí // 🔑

== Proces zabezpečení počítačové sítě
- Zabezpečení není o instalaci nějaké "velké bezpečnostní krabice", ale o definici procesu bezpečného používání sítě a jeho vynucování
- Pravidla zabezpečení vždy *omezují* uživatele, je proto nutné najít *kompromis* mezi pohodlím uživatelů a bezpečností sítě
- Zahrnuje zabezpečení - *infrastruktury sítě*, *operačních systémů*, *uživatelských stanic* a *ochranu proti virům*

== Základní terminologie
- #highlight[*Autentizace*] - ověření *identity* odesílatele dat
- #highlight[*Šifrování*] - proces *zabezpečení* dat, aby je nepovolaná osoba *nemohla* přečíst
- #highlight[*Integrita dat*] - ověření, zda data nebyla během přenosu *změněna*
- #highlight[*Dostupnost*] - zajištění, že informace jsou dostupné, když jsou potřeba
- #highlight[*Nepopíratelnost*] - zajištění, že odesílatel nemůže popřít odeslání konkrétního datového bloku (např. že jej podepsal)


== Obecný kryptografický systém
- #highlight[*Šifrování*] (*encryption*) - transformace dat pomocí *šifrovacího algoritmu*
- #highlight[*Dešifrování*] (*decryption*) - obrácený proces, kde se šifrovaný text vrátí na původní, čitelný text
- #highlight[*Klíče*] - *parametry*, které jsou použity k *šifrování* a *dešifrování*
#figure(image("../images/krypto.png", width: 70%))

#pagebreak()

== #highlight[Symetrický kryptografický systém]
- Používá se *sdílený tajný klíč*, který musí být *bezpečně* distribuován mezi komunikující strany
- Implementace je efektivní a rychlá
- Šifrovací algoritmy jako *DES*, *3DES*, *AES* jsou běžně používány
- Hlavní problém je bezpečná distribuce tajného klíče

=== Autentizace
- Odesílatel šifruje uživatelské jméno sdíleným klíčem a příjemce dešifruje tímto klíčem a ověřuje platnost jména (vyžaduje databázi validních uživ. jmen)
- Další možností je připojení *hash* jména a pak celé toto spojení šifruje klíčem
- Příjemce dešifruje a zkontroluje, zda hash odpovídá skutečnému jménu (nevyžaduje databázi uživ. jmen)

=== Kontrola integrity dat
- Odesílatel spočítá hash zprávy a připojí k ní tajný sdílený klíč
- Příjemce připojí sdílený klíč k přijaté zprávě, vypočítá hash a porovná jej s přijatým hashem

== #highlight[Asymetrický kryptografický systém]
- Používá *veřejný* a *soukromý klíč*, jeden pro šifrování a druhý pro dešifrování, klíče se generují jako jeden *pár*
- Algortimy pro šifrování a dešifrování jsou buď *identické*, nebo komplementární
- Vyžaduje více výpočtů než symetrické šifrování #sym.arrow *je pomalejší*
- Příklady jsou *RSA*, *El-Gammal*

=== Příklad
- Alice šifruje zprávu pomocí *veřejného* klíče Boba
- Bob dešifruje zprávu pomocí *svého soukromého klíče*
- Stejně tak může Bob šifrovat zprávu pro Alici pomocí *jejího veřejného klíče*, kterou Alice dešifruje *svým soukromým klíčem*

#figure(image("../images/krypto2.png", width: 70%))

=== Využití
- *Digitální podpisy* - zaručují integritu a autentizaci dat, bez potřeby bezpečného přenosu tajného klíče
- *Výměna klíčů pro symetrické šifrování* - veřejné a soukromé klíče mohou být použity k bezpečné výměně klíčů pro symetrické šifrování
- *Dynamicky generované klíče* - klíče mohou mít omezenou životnost a měnit se během komunikace

#pagebreak()

== #highlight[Certifikační autorita (CA)]
- *Důvěryhodná entita*, která digitálně podepisuje veřejné klíče spolu s informacemi o vlastníkovi, čímž vytváří *cerfitikáty*
- *Veřejný klíč CA* je zabudován do *operačních systémů* a *prohlížečů*, využívá se k ověření pravosti certifikátů CA

=== Postup vytvoření certifikátu
- Klient vytvoří *pár veřejného a soukromého* klíče na své straně
- Veřejný klíč je odeslán k CA k *podepsání*
- CA přidá informace o vlastníkovi (doména apod.) a použije *svůj soukromý klíč* k digitálnímu podpisu
- Výsledkem je *certifikát* (podepsaný veřejný klíč)
- Soukromý klíč by měl být *chráněn* a nikdy *nesmí být odeslán k CA*, slouží k dešifrování zpráv nebo vytváření digitálních podpisů 

== Zabezpečení na jednotlivých vrstvách OSI modelu
- #highlight[*L2 (linková vrstva)*]
  - Zabezpečení je na úrovni jednotlivých *skoků* (hop-by-hop)
  - *Není efektivní*
- #highlight[*L3 (síťová vrstva)*]
  - Nezávislé na topologii a aplikaci
  - Používá protokol *IPsec* pro šifrování a ověření IP komunikace
- #highlight[*L4 (transportní vrstva)*]
  - *TLS* (*Transport Layer Security*) - zabezpečení na úrovni přenosu dat (pouze pro *TCP*)
  - Existují i verze pro UDP, ale nejsou běžné
- #highlight[*L7 (aplikační vrstva)*]
  - Zabezpečení řešeno přímo *aplikacemi*, např.: *S/MIME* - šifrování a podepisování e-mailů

== Filtrování provozu
=== 1. #highlight[Stateless] (filtrování paketů)
- Rozhoduje o *propustnosti* nebo *zahození jednotlivých paketů*
- Základem je *inspekce dat* v paketu (hlavička, IP, porty apod.)
- *Problém* - nemůže efektivně kontrolovat vyšší vrstvy (L4+) v případě fragmentace paketů

=== 2. #highlight[Stateful] (transparentní proxy nebo server)
- Analyzuje celé *datové toky* (spojení)
- Umožňuje detailnější kontrolu

#pagebreak()

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == #highlight[Access Control Lists (ACL)] - stateless
    - Nejčastěji se využívá na rozhraních *routeru*, občas i na switchi
    - Filtrují příchozí a odchozí provoz podle hlaviček *L3/L4* (*IP adresy, porty* apod.) a někdy i *L2* polí (MAC adresy)
    - ACL je sekvence pravidel, které:
      - Povolují (*permit*) nebo zakazují (*deny*) provoz, který odpovídá nastaveným kritériím
      - Prohlíží se postupně *shora dolů* a *první shoda* určuje akci, dále se v prohlížení pravidel *nepokračuje*
      - Pokud žádné pravidlo *neodpovídá*, je provoz *zahozen* (deny)

    === Implementace
    - *Rozhraní* - ACL se přiřazuje na konkrétní *síťové rozhraní*, každé rozhraní může mít vlastní ACL
    - Směr provozu
      - *Příchozí* (*inbound*) - filtruje data přicházející na rozhraní
      - *Odchozí* (*outbound*) - filtruje data vycházející z rozhraní
    - *Kritéria filtrování* - pravidla, podle kterých se rozhoduje o propustnosti
    - *Častá chyba* - nezapomenout povolit vracející se provoz, jinak může dojít k blokování odpovědí. Když bychom povolili například ping směrem ven, ale ne zpět, server sice odpoví, ale odpověď se k nám kvůli chybějícímu pravidlu nedostane.

  ],
  [],
  [
    == #highlight[Firewall] - stateful
    - Oddělují *důvěryhodnou síť* (interní) od *nedůvěryhodné sítě* (externí)
    - Občas připojuje i *Demilitarizovanou zónu* (DMZ)
      - Obsahuje servery přístupné z externí sítě
      - Servery v DMZ mají dobře zabezpečený OS ("bastion hosts")
      - Omezená komunikace mezi servery v DMZ, a mezi servery v DMZ a interní sítí
      - Interní síť není dostupná z externí sítě

    #figure(image("../images/firewall.png", width: 70%))

    === Druhy firewallů
    - #highlight[*Transparentní*] - funguje jako router, propouští *povolený provoz*
    - #highlight[*Proxy server*] - protokoly aplikační vrstvy (L7), např. HTTP proxy, SMTP proxy

    === Hardwarové firewally
    - Například Cisco PIX/ASA, Juniper firewall
    - Detaily implementace OS nejsou veřejné #sym.arrow někteří považují za bezpečnější

    === Softwarové firewally
    - Linux (iptables) - základní podpora stavového filtrování
    - NetBSD - flexibilní, čitelné konfigurační soubory
  ]
)

=== Syntaxe pro Cisco IOS
```cisco
  access-list <acl_number> {permit | deny} <PROTOCOL>
    <source-IP-addr> <source-addr-wildcard> [<source-port>] 
    <destination-IP-addr> <destination-addr-wildcard> [<destination-port>]
    [protocol-dependent-options]
```

=== Příklady ACL
`access-list 101 permit udp 200.1.1.100 0.0.0.0 eq 53 158.196.135.0 0.0.0.255`
- Povoluje UDP provoz z 200.1.1.100/32:53 na síť 158.196.135.0/24

`access-list 101 permit icmp 0.0.0.0 255.255.255.255 158.196.135.0 0.0.0.255 echo-reply`
- Povoluje ICMP odpovědi typu echo-reply z libovolné IP adresy směrem do sítě 158.196.135.0/24

`access-list 101 deny ip 100.1.1.0 0.0.0.255 158.196.135.0 0.0.0.255`
- Zakazuje veškerý provoz na 3. vrstvě (IP provoz, všechny pakety) ze sítě 100.1.1.0/24 na síť 158.196.135.0/24
- *any* = jakákoliv IP adresa + wildcard maska 255.255.255.255
- *host* X.X.X.X = IP adresa X.X.X.X + wildcard maska 0.0.0.0.

#pagebreak()

== #highlight[NAT pro zabezpečení sítě]
- Pouze několik nebo jedna veřejná IP adresa je *dostupná z vnější sítě* , čímž jsou *skryté* vnitřní adresy zařízení
- *Dynamický NAT* - Provoz do vnitřní sítě je povolen pouze, pokud někdo zahájí komunikaci z vnitřní sítě. Toto zařízení je viditelné z vnějších sítí pod *různými* veřejnými IP adresami najednou

== #highlight[VPN (Virtual Private Network)]

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    - Umožňuje vytvářet *privátní WAN* sítě pomocí veřejné sdílené infrastruktury, ale s úrovní zabezpečenosti jako by šlo o *privátní infrastrukturu*
    - Používá metody *tunelování* a *šifrování*, včetně *autentizace*

    === Tunel
    - *Virtuální point-to-point* spojení přes veřejnou infrastrukturu
    - Přenáší pakety jednoho protokolu, které jsou *zapouzdřeny v jiném protokolu* (IP over IP)
    - Tunel může také přenášet L2 rámce

    === Výhody VPN oproti fyzické privátní WAN 
    - Nižší náklady
    - Větší flexibilita virtuální *topologie*, nevyžaduje změny ve fyzické infrastruktuře
    - Není potřeba* údržba WAN spojení*
  ],
  [],
  [
    #figure(
      image("../images/vpn.png", width: 110%), 
      caption: [Porovnání VPN s privátní \ infrastrukturou]
    )

    === Nejčastější implementace VPN
    - L3 VPN - *IPsec*
    - L4 VPN - *SSL*
    - L7 VPN - na úrovní aplikací (např. *WWW*)
  ],
)





== #highlight[Síťové útoky]
=== Man-in-the-Middle
- Útočník poslouchá komunikaci *mezi dvěma stranami*
- Může pouze poslouchat, nebo také měnit data, která jsou přenášena
- *Těžko detekovatelný*

=== Denial of Service (DoS)
- Cílem útočníka je *vyčerpat prostředky serveru* (paměť, CPU...), což způsobí výpadek systému
- Útočník často využívá zfalšovanou IP adresu aby se dostal přes filtry
- *DDoS (Distributed Denial of Service)* - pokud útok přichází z více než jednoho místa, administrátor nemůže rychle reagovat na změny přichozího provozu
- Příklady:
  - *TCP SYN flood* - útočník zasílá velký počet SYN požadavků, ale nikdy neodesílá ACK, což zaplaví cílový server
  
