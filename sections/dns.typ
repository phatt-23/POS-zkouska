#set page(
  header: align(right)[
    _DNS_
  ]
)

= DNS

- Překládá logická jména (*domény*) na *IP adresy* a *naopak*
- Klient (*resolver*) posílá dotazy na DNS servery
- *Servery mohou spolupracovat mezi sebou*
- Využívá *distribuovanou databázi*, která je uložená na DNS serverech (name servers)

== #highlight[DNS komunikační protokol]
- Pro běžné dotazy a odpovědi využívá *UDP/53*
- Pro dlouhé odpovědi a přenosy zón *TCP/53*

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == #highlight[Doménová jména]
    - *Hierarchická struktura* podobná stromu
    - Každý uzel má svůj název - *domain name*
    - Doména je skupina názvů sdílejících stejný koncový přívlastek (suffix)
    - *Kořenová doména je označena jako "."* (tečka)

    === Jak se tvoří doménové jméno
    - Skládá se z názvů uzlů oddělených tečkami až ke kořeni
    - Maximální délka názvu uzlu je *63 znaků*
    - Maximální délka celého doménového jména je *255 znaků* 
        (u e-mailových adres 253 znaků)

    === Jejich vlastnosti
    - *Nerozlišují* velká a malá písmena
    - Možnost použití *národních znaků* 
        (např. nějaké korejské znaky apod.) - ale nedoporučuje se to

  ],
  [],
  [
    == #highlight[Strom doménových jmen]
    === Nejvyšší úroveň (Top-Level Domains - TLD)
    - *Obecné* - .edu, .com, .net, .org
    - *Národní* (ccTLD) - .cz, .at, .sk
    - Národní v jejich abecedě - .рф
    - *Infrastrukturní* - .arpa
    - *Rezervované* - .localhost, .example, .test

    === Zóna
    - Část stromu spravována *jedním DNS serverem*
    - *Autoritativní server* - DNS server, který má odpovědnost 
        za všechny domény v jemu spravovaných zónách
  ],
)

== #highlight[Vyhledávání v DNS databázi]
- Provádí jej *klientský software* (resolver) nebo jiný *DNS server* (rekurzivně)
- Doménové jméno je postupně rozloženo na *části*, začínající od *kořene*
- Adresy kořenových serverů musí být předem nastaveny
- DNS server může:
  - *Odmítnout požadavek* - pokud nemá odpovědnost za danou doménu
  - *Provést rekurzivní vyhledávání *- zjistí odpověď od jiných serverů   
      a vrátí ji klientovi jako neautoritativní odpověď

== #highlight[Jak probíhá vyhledávání? (homel.vsb.cz.)]
- *Kořen (.)* - resolver se nejprve dotáže na kořenové servery. Ty jsou hardcodnuté a znají NS záznamy pro všechny TLD (např. cz, com, org)
- *TLD (cz.)* - kořenový server vrátí NS odpovědné za doménu cz. (např. a.nic.cz)
- *Druhá úroveň (vsb.cz.) *- name servery pro cz. vrátí informace o tom, které servery jsou odpovědné za doménu vsb.cz.
- *Třetí úroveň (homel.vsb.cz.)* - servery odpovědné za vsb.cz. vrátí konkrétní záznam (např. A, MX...) který odpovídá doméně homel.vsb.cz.


#pagebreak()

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [

    == #highlight[Primární a sekundární DNS servery]

    === Primární servery
    - Záznamy zóny jsou trvale uloženy v konfiguračním souboru na primárním serveru
    - Správce musí po každé změně záznamů zvýšit číslo verze zóny

    === Sekundární servery
    - Pravidelně kontrolují *aktuálnost záznamů* oproti *primárnímu serveru*
    - Pokud zjistí novější verzi, provádí *přenos zóny* (zone transfer)
    - Každá doména/zóna musí mít alespoň jeden sekundární server
    - Existují i *caching-only* servery, které nejsou autoritativní - pouze 
        vyhledávají rekurzivně a ukládají si záznamy do cache
  ],
  [],
  [
    == #highlight[Resolver]
    - Klientská součást systému, která překládá doménová jména na resource records
    - Provádí *rekurzivní* nebo *iterativní* dotazy na DNS servery
    - Může být součástí operačního systému
    - Může také ověřovat záznamy

    === Nastavení resolveru
    - *Defaultní doména *- pro relativní názvy (přidává se automaticky)
    - Primární a záložní DNS servery
    - Seznam kořenových serverů
  ],
)


#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == #highlight[Záznamy v DNS databázi]
    - *Doménové jméno* - pro jakou doménu záznam platí
    - *Typ záznamu* - druh informací (např. A, MX, CNAME...)
    - *Data* - obsah záznamu
    - *TTL* (Time To Live) - pro jakou dobu mohou klienti 
        uchovávat záznam v cache, většinou několik hodin nebo dnů

    == #highlight[Wildcards v DNS]
    - Zástupný znak \* může být použit na začátku doménového 
      jména k reprezentaci *libovolné hodnoty*, např. \*.example
    - Pokud ale existuje přesný záznam, má *přednost před zástupným znakem*
    - Když je znak \* uvnitř doménového jména (např. sub.\*.example.), není 
      považován za zástupný znak
    - Dotaz typu ANY nebo \* získá všechny záznamy pro danou doménu, 
      ale tyto dotazy mohou být na serveru blokovány
  ], [], 
  [
    == #highlight[Nejčastější typy záznamů]
    - *A* - překládá doménové jméno na IPv4 adresu
    - *AAAA* - překládá doménové jméno na IPv6 adresu
    - *CNAME* - alias pro jiné doménové jméno
    - *MX* - záznamy pro e-mailové adresy (mail exchange)
    - *NS* - záznam o DNS serverech autoritativních pro doménu
    - *PTR* - reverzní záznamy (IP na doménu)
    - *TXT* - libovolný textový obsah, např. pro SPF nebo DKIM validaci
    - *SRV* - definice služeb a adresu serveru (např. SMTP server)
    - *SOA* - informace o doméně jako jsou hlavní nameserver a email správce

    ```
    vsb.cz.			5102	IN	MX	20 postak.vsb.cz.
    vsb.cz.			5102	IN	MX	30 mx30.vsb.cz.
    vsb.cz.			5102	IN	MX	40 smtp.vsb.cz.
    vsb.cz.			6351	IN	NS	sun.uakom.sk.
    vsb.cz.			6351	IN	NS	nsa.ces.net.
    vsb.cz.			6351	IN	NS	decsys.vsb.cz.

    _smtp._tcp.example.com. 3600 IN SRV 10 5 25 mail.example.com.
    ```
  ]

)

#pagebreak()

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == #highlight[Reverzní domény]
    - Slouží k převodu *IP adres* na *doménová jména*
    - Jsou zapsány pod doménou in-addr.arpa.
    - Subdomény jsou pojmenovány podle jednolivých bytů IP adresy, od levého bytu k pravému
    - Pro IP adresu 158.196.146.10 odpovídá reverzní doména
    - `10.146.196.158.in-addr.arpa.`
    - Reverzní domény využívají záznamy typu *PTR* (Pointer record)
    - Zákazníci by museli kontaktovat svého ISP pokaždé, když změní název některého zařízení, nebo přidají nové zařizení do své sítě. Řešením je použití aliasů (CNAME) v reverzní doméně u ISP pro všechny možné adresy, které odkazují na unikátní jména v pomocné subdoméně
    - Pomocnou subdoménu spravuje zákazník
  ],
  [],
  [
    == #highlight[DNS záznamy pro elektronickou poštu]
    - *MX záznam* slouží k určení serveru, který přijímá e-maily pro danou doménu
    - Pokud posílám e-mail na adresu *somebody\@mydomain.com*, 
      DNS se podívá na *MX záznam* pro doménu *mydomain.com*
    ``` 
    mydomain.com.    MX 1 mailserver.mydomain.com
    ```
    - Tento záznam ukazuje, že e-maily pro mydomain.com směřují na server *mailserver.mydomain.com*
    - Číslo 1 je *priorita* serveru (čím nižší číslo, tím vyšší priorita)
    - *MX záznamů může být více*
    - Pokud není MX záznam pro danou doménu, použije se *A záznam* pro danou doménu (např. mydomain.com. A 192.168.1.1)

  ],

)


== #highlight[SRV záznamy]
- Umožňují hledání služeb (např. IMAP, HTTPS) v DNS
- Obsahují *prioritu* (stejně jako u MX), *váhu*, *číslo portu* pro připojení k dané službě
- `_imaps._tcp.gmail.com. SRV 5 0 993 imap.gmail.com.`
- Tento záznam říká, že pro IMAPS službu na doméně *gmail.com* použijeme server *imap.gmail.com* na portu *993*


#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == #highlight[Dynamic DNS (DDNS)]
    - Umožňuje *dynamické mapování* doménových jmen na IP adresy, které se mohou měnit (např. u zařízení s DHCP)
    - *Automatické aktualizování DNS záznamů* bez nutnosti manuálních zásahů, když se změní IP adresy
    - V praxi se využívá velmi zřídka

    == #highlight[Multicast DNS (mDNS)]
    - Technologie používaná pro DNS dotazy, pokud není k dispozici žádný tradiční DNS server
    - Používá doménu *.local* a zprávy jsou směrovány na multicastovou adresu 224.0.0.251 (pro IPv4) nebo FF02::FB (pro IPv6)
    - Pro zařízení *Android*, *Apple Bonjour*, *Chromecast* a *Windows 10 pro objevování tiskáren*
    - Pokud máme zařízení v lokální síti, které používá mDNS a poskytuje nějakou službu, třeba tiskárnu, můžeme použít mDNS pro zjištění této služby

  ],
  [],
  [
    == #highlight[DNSSEC (DNS Security)]
    - Bezpečnostní rozšíření DNS, které slouží k *autentizaci DNS odpovědí*
    - Využívá *digitální podpisy* a *veřejné klíče* pro ověření správnosti záznamů
    - *Zabraňuje falšování DNS odpovědí*, například útokům typu *Man-in-the-Middle*

    == #highlight[Encrypted DNS]
    - *DNS přes TLS (DoT)* a *DNS přes HTTPS (DoH)* jsou metody šifrovaného DNS, které chrání uživatelé soukromí tím, že *šifrují DNS dotazy*

    == #highlight[DNS64]
    - Vytváří "falešné" *AAAA* záznamy pro klienty, kteří využívají *IPv6*, ale cílový server podporuje pouze *IPv4*
    - Spolupracuje s *NAT64* (NAT pro IPv6)
    - Používá speciální prefix pro přechod mezi IPv6 a IPv4 adresami
    - `ipv4only.arpa`
  ],
)



