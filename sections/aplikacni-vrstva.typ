#set page(
  header: align(right)[
    _Aplikační vrstva_
  ]
)

= Aplikační vrstva

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == Elektronická pošta
    - V základu *neprobíhá komunikace šifrovaně*
    - Všechny mailové protokoly jsou *textové*

    === Struktura zpráv:

    - *Obálka* - identifikuje odesílatele a příjemce
    - *Hlavička* - řádky ve formátu "název: hodnota", slouží k *přenosu metadat* o zprávě (např. *předmět*, *odesílatel*, čas doručení apod.), prázdný řádek značí konec hlavičky
    - *Tělo* - obsahuje *samotný text* zprávy nebo *připojené soubory*, maximální délka *64 kB*

    === #highlight[SMTP] (Simple Mail Transfer Protocol)

    - Zajišťuje *odesílání zpráv* a jejich doručování mezi *mailovými servery* a mezi *klientem* a *serverem*
    - *TCP/25*, *TCP/587* (*SMTPS*)
    - Příkazy:
      - *HELO* (identifikuje "klienta"), dneska se využívá *EHLO*
      - *MAIL FROM*.- identifikuje *odesílatele*
      - *RCPT TO* - určuje *příjemce* zprávy, lze uvést více příjemců
      - *DATA* - signalizuje začátek *dat zprávy*, řádek obsahující pouze tečku značí konec dat

    === #highlight[MIME] (Multimedia Mail Extension)

    - *Rozšiřuje* možnosti e-mailů
    - Specifikuje, jak *interpretovat* data zpráv a jak je *zpracovat* - *text/html*, *image/jpg*
    - Udává, jak kódovat *binární data* - původní specifikace podporovala pouze *7bitové ASCII znaky*

    === #highlight[POP3] (Post Office Protocol v. 3)

    - Zajišťuje *stahování všech e-mailů* ze schránky serveru k uživateli
    - *TCP/110* - POP3, nešifrovaná komunikace
    - *TCP/995* - POP3s, šifrovaná komunikace
    - Příkazy:
      - *USER, PASS* - autentizace uživatele
      - *LIST* - seznam ID uložených zpráv
      - *RETR* - stáhne zprávu dle zadaného ID


  ], [],
  [
    === #highlight[IMAP] (Internet Message Access Protocol)
    - *Sofistikovanější* než POP3
    - *TCP/143*, *TCP/993* (IMAPS)
    - Zaměření na omezení počtu přenosů mezi serverem a klientem
    - Vhodné pro *pomalé připojení* a *mobilní zařízení*
    - Klient může požádat o hledání v e-mailech *přímo na serveru*, aniž by je musel stahovat
    - *Vylepšená autentizace*

    == Emulace terminálu

    === #highlight[Telnet] (TCP/23)

    - Umožní vzdálený přístup k terminálu přes *TCP*
    - *Komunikace probíhá nešifrovaně*
    - Podporuje NVT (Network Virtual Terminal)

    === #highlight[SSH] (TCP/22)

    - *Bezpečnější* alternativa Telnetu
    - Využívá *asymetrické šifrování*
    - Podporuje přenos souborů (SCP), X-Window

    == Protokoly pro přenos souborů 📥

    === #highlight[FTP] (File Transfer Protocol)

    - *Obousměrný* přenos souborů #sym.arrow od klienta na server a naopak
    - Používá odděleně *řídící spojení* (*TCP/21*) a *datové spojení* (*TCP/20*)
    - *Základní FTP příkazy*: USER, PASS, LIST, RETR
    - *Odpovědi na FTP příkazy*: 3místné číselné kódy
    - Podporuje *aktivní* (server naváže datové spojení zpět na klienta, což může blokovat firewall) i *pasivní* (klient navazuje spojení na server) režim

    === #highlight[TFTP] (Trivial FTP)

    - Jednodušší verze běžící přes *UDP*
    - *Nepodporuje autentizaci*, vhodné na nahrávání firmware na OS
    - Umožňuje stanicím *stáhnout soubor pro start OS ze serveru*
    - Používá potvrzovacího schématu stop-and-wait

  ],
)

#pagebreak()

== URI a URL
#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    === #highlight[URI] (Uniform Resource Identifier) 

    - Slouží k jednoznačné identifikaci zdroje na internetu
    - URL je podmnožinou URI 🤓

  ], [],
  [
    === #highlight[URL] (Uniform Resource Locator) 

    - Určuje, *kde* konkrétně se zdroj nachází (například na serveru) a *jak* k němu přistoupit (protokol)
    - Např. `https://www.example.com/index.html`
    - Obsahuje *protokol* (`https`), *doménu* (`www.example.com`), a *cestu* (`/index.html`)
    - Všechny URL jsou URI, ale ne všechny URI jsou URL 🤓

  ]
)


== HTTP - Hyper Text Transfer Protocol
#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    - Klient-server architektura, požadavek-odpověď protokol
    - Využívá *URL* pro identifikaci zdroje
    - Využívá *MIME* pro popis formátu dat

    === #highlight[Formát HTTP požadavku]
    - *Metoda* (GET, POST, PUT) *Cesta* *Protokol*
    - *Hlavičky*
    - (*Data* - např. formulář)

    #figure(image("../images/request.png", width: 80%))

    === #highlight[Formát HTTP odpovědi]
    - *Protokol* + *Kód* + *Zpráva*
    - *Hlavičky*
    - (*Data* - např. HTML stránka)

    #figure(image("../images/response.png", width: 80%))

  ],
  [],
  [
    === #highlight[HTTP kódy odpovědí]
    - 1xx - *Informativní* (např. 100 Continue)
    - 2xx - *Úspěch* (např. 200 OK)
    - 3xx - *Přesměrování* (např. 304 Not Modified)
    - 4xx - *Chyba klienta* (např. 404 Not Found)
    - 5xx - *Chyba serveru* (např. 502 Bad Gateway)

    === #highlight[Nejužitečnější HTTP REQUEST headers]
    - *Accept* - Určuje média, která klient přijímá (většinou \* pro všechny)
    - *Authorization* - Autentizační údaje klienta
    - *User-Agent* - Název a verze prohlížeče
    - *If-Modified-Since* - Použije požadavek jen, pokud byl dokument změněn od určitého data
    - *Referrer* - Odkud klient získal URL požadovaného zdroje (užitečné pro statistiky)

    === #highlight[Nejužitečnější HTTP RESPONSE headers]
    - *Content-Type* - MIME typ dokumentu (např. text/html)
    - *Content-Length* - Délka dokumentu
    - *Last-Modified* - Čas poslední modifikace dokumentu
    - *Location* - Přesměrování na jinou URL
    - *Server* - Název a software HTTP serveru
  ],
)

#pagebreak()

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    === #highlight[HTTP 1.0 (RFC 1945)]
    - Spojení je zahájeno *klientem* a ukončeno *serverem*
    - Pokud webová stránka obsahuje *více* mediálních souborů, každý soubor je stažen přes *samostatné TCP spojení*

    === #highlight[HTTP 1.1 (RFC 2068)]
    - Klient může požádat server, aby udržoval TCP spojení *i po dokončení přenosu* požadovaného dokumentu
    - Není nutné zakládat nové TCP spojení pro každý požadavek
    - Klient může požádat o *konkrétní část* dokumentu (užitečné při výpadku spojení během přenosu)
    - Podpora *virtuálních hostitelů* - více logických serverů poslouchajících na stejné IP adrese, užitečné například pro sdílené hostingy, kde je na jedné IP adrese více webových stránek
    - Pro rozlišení stránek se do hlavičky přidá *Host*, kde se specifikuje URL adresa webové stránky
    - Podporuje *kompresi dat* během přenosu

    === #highlight[HTTP 1.1 - Chunks]
    - *Transfer-Encoding: chunked* - Pokud je tato hlavička přítomna, neznáme nebo neuvádíme délku obsahu, ale posíláme data po *blocích*
    - Používá se pro požadavky i odpovědi
    - Často se používá ve spojení s *Content-Encoding: gzip*
    - Každý blok má před sebou řádek s hexadecimální délkou
    - Přenos *končí*, když je *délka bloku 0*
  ],
  [],
  [

    === #highlight[HTTPS (Secure HTTP)]
    - *Zabezpečená* verze protokolu HTTP
    - HTTP přes *SSL* (starší) nebo *TLS* (novější)
    - Obvykle na portu *TCP/443* (HTTP využívá port 80)
    - *Certifikační autority* (*CA*) - certifikát, který server využívá, musí být vydán důvěryhodnou certifikační autoritou (např. Let's Encrypt)
    - Certifikáty se dělí na *DV* (Domain Validation - základní zabezpečení) a *EV* (Extended Validation - nejvyšší úroveň zabezpečení)


    === #highlight[HTTP/2]
    - *Modernější* a *efektivnější* verze protokolu HTTP, která přináší řadu výhod
    - Byla standardizována v roce 2015 v rámci RFC 7540 a navazuje na protokol SPDY od Googlu
    - *Interleaving požadavků* - místo jednoduchého řazení (pipelining) umožňuje provádět *více požadavků najednou* a zpracovávat odpovědi *nezávisle*
    - *Multiplexing* - v jedné TCP relaci může probíhat více datových toků *současně*
    - *Push odpovědi* - server může poslat data, která klient pravděpodobně bude potřebovat (např. CSS nebo JavaScript soubory), aniž by o ně klient vysloveně požádal
    - *Komprese hlaviček* pro zmenšení velikost, což šetří přenosovou kapacitu
    - Pro HTTP i HTTPS - obvykle pouze přes *HTTPS* pro bezpečnost
    - *Aktivace HTTP/2* - klient může požádat server o použití HTTP/2 pomocí hlaviček


  ],
)


#pagebreak()

== #highlight[Cookies] 🍪
#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    - Jsou to malé datové soubory, které umožňují serveru udržovat stavovou komunikaci s klientem
    - Pomáhají *identifikovat uživatele* a *uchovávat informace mezi jednotlivými požadavky*
    - Základní struktura cookies:
      - *Name*: název cookie
      - *Value*: hodnota cookie
      - *Server* a *path*: určuje, pro které URL je cookie platná
      - *Max-Age*: doba platnosti cookie
      - *Secure*: označuje, že cookie lze přenášet pouze přes HTTPS
    - *Server* #sym.arrow *Klient*: Hlavička *Set-Cookie* umožňuje serveru nastavit cookie v prohlížeči
    - *Klient* #sym.arrow *Server*: Při každém požadavku je cookie automaticky přidána do hlavičky Cookies, pokud odpovídá aktuální URL
    - `HTTP/2.0 200 OK
    Content-Type: text/html
    Set-Cookie: yummy_cookie=chocolate
    Set-Cookie: tasty_cookie=strawberry
    
    [page content]`

  ], [], 
  [
    #figure(image("../images/cookies.png", width: 100%))
  ]
)

== Protokoly pro automatickou konfiguraci síťového připojení

#grid(
  columns: (1fr, 0.1fr, 1.8fr),
  [
    === #highlight[Bootstrap Protocol (BOOTP)]
    - UDP porty 68 (klient), 67 (server)
    - Starší protokol určený k poskytování síťových konfiguračních parametrů zařízení podle jejich *MAC adresy*
    - BOOTP server obsahuje databázi mapování MAC adres na IP adresy
    - Poskytuje - *IP adresu, masku podsítě, gateway*
    - Klienti BOOTP požadují od serveru tyto parametry
  ], [], 
  [
    === #highlight[Dynamic Host Configuration Protocol (DHCP)]
    - UDP porty 68 (klient), 67 (server)
    - Modernější protokol, který dynamicky přiděluje síťové parametry z *poolu dostupných adres*
    - Každá IP adresa je *pronajata na určitou dobu* (lease time)
    - Klient musí periodicky *obnovovat pronájem* (lease renewal)
    - DHCP umožňuje pevné přiřazení IP adresy specifickým MAC adresám
    - Poskytuje více parametrů než BOOTP - *DNS servery*, NTP servery atd.
    - První zpráva je vždy odeslána jako *UDP broadcast*
    - DHCP je *zpětně kompatibilní* s BOOTP

    *Zprávy v DHCP*
    - *DHCP Discover* - klient hledá dostupný DHCP server pomocí *broadcastu*
    - *DHCP Offer* - server odpoví nabídkou síťových parametrů k *pronájmu*
    - *DHCP Request* - klient požádá o *rezervaci* nabízených parametrů
    - *DHCP ACK* - server *potvrdí přidělení parametrů*

  ]
)

