#set page(
  header: align(right)[
    _Příprava na druhý test_
  ]
)

= Příprava na druhý test // 🎰

#figure(image("../images/wireshark.png", width: 100%))

#figure(image("../images/wireshark-2.png", width: 100%))

#figure(image("../images/wireshark-3.png", width: 100%))

#figure(image("../images/wireshark-4.png", width: 100%))

#figure(image("../images/test-2.png", width: 100%))

#figure(image("../images/test-2-2.png", width: 100%))

#pagebreak()

== Další otázky na 2. test
#line(length: 100%)

=== O metodě LSA (link state algorithm) lze říci
- _true_ - Je příkladem dynamického směrování
- _true_ - Směrovače znají topologii sítě
- _true_ - Je reprezentována směrovacím protokolem OSPF
- _false_ - Směrovače posílají sousedům směrovací tabulku
- _false_ - Pomalu konverguje
- _false_ - Je reprezentována směrovacím protokolem RIP

=== Hlavička protokolu TCP
- _true_ - Obsahuje čísla zdrojového a cílového portu
- _true_ - Posílá číslo následujícího oktetu, který je možno odeslat (čímž potvrzuje poslední přijatý oktet)
- _true_ - Je vkládána do rámců přímo na začátek datového pole
- _true_ - Obsahuje pole jednobitových příznaků určených k řízení spojení
- _false_ - Obsahuje kontrolní součet, který ale nemusí být vyplněn
- _false_ - Obsahuje číslo protokolu, neseného v TCP segmentu
- _false_ - Obsahuje číslo posledního správně přijatého oktetu

=== SMTP server komunikuje
- _true_ - S jiným SMTP serverem
- _true_ - Se SMTP klientem (user agent)
- _false_ - S POP3 serverem, od kterého přijímá e-maily
- _false_ - Jak s POP3, tak s IMAP serverem
- _false_ - S IMAP serverem
- _false_ - S IMAP klientem

=== O metodě DVA (distance vector algorithm) lze říci:
- _true_ - Je příkladem dynamického směrování
- _true_ - Směrovače poskytují sousedům směrovací tabulku.
- _true_ - Pomalu konverguje
- _true_ - Je reprezentován směrovacím protokolem RIP
- _false_ - Je reprezentován směrovacím protokolem OSPF
- _false_ - Směrovače znají topologii celé sítě

=== SMTP server
- _true_ - Přijímá e-maily od poštovního klienta (user agent)
- _true_ - Může navazovat TCP spojení s jinými SMTP serverem.
- _true_ - Přijímá e-maily od jiného SMTP serveru.
- _false_ - Odesílá e-maily poštovním klientem (user agent)
- _false_ - V případě neexistence schránky příjemce zasílá klientovi zprávu ICMP Destination Unreachabble
- _false_ - Posílá e-maily jiného SMTP serveru jako UDP datagramy.

=== Protokol RIP
- _true_ - Běží mezi směrovači
- _true_ - Počítá nejkratší (nejlevnější) cesty do všech sítí
- _true_ - Předává sousedovi směrovací tabulku
- _false_ - Běží mezi přepínači
- _false_ - Předává sousedovi tabulku dvojic MAC adresa, port
- _false_ - Zabraňuje vzniku smyček na 2. vrstvě

=== Následující typy záznamů jmenných serverů mají tyto významy
- _true_ - PTR – přiřazuje ke speciálnímu zápisu IP adresy doménové jméno
- _true_ - CNAME – určuje alias pro dané doménové jméno
- _true_ - NS – určuje autoritativní jmenný server pro danou doménu
- _false_ - SOA – Definuje všechny neautoritativní servery pro danou doménu.
- _false_ - MX – určuje WINS server (jmenný server pro protokol MS NetBios)
- _false_ - A – přiřazuje k IP adrese k doménové jméno

=== Pro odesílání a příjem elektronické pošty slouží následující protokoly
- _true_ - SMTP
- _true_ - POP3
- _true_ - IMAP
- _false_ - SNMP
- _false_ - FTP
- _false_ - BOOTP

=== Referenční model ISO-OSI
- _true_ - Na 3. vrstvě realizuje směrování mezi sítěmi
- _true_ - Pro přenos dat na 4. vrstvě může využívat metodu plovoucího okénka (sliding window)
- _true_ - Definuje na 1. vrstvě fyzické parametry rozhraní
- _true_ - Definuje jako standardní protokol 3. vrstvy protokol IP
- _false_ - Definuje na spojové vrstvě (link layer) způsoby svařování kabelů
- _false_ - Obsahuje 10 vrstev

=== Služba doménových jmen (DNS)
- _true_ - Umožňuje používat doménová jména o délce komponenty max. 63 znaků
- _true_ - Využívá pro komunikaci protokoly UDP i TCP
- _true_ - Umožňuje překlad IP adres na doménová jména
- _false_ - Rozlišuje malá a velká písmena (je case-sensitive)
- _false_ - Používá jako oddělovač komponent jmen dvojtečku
- _false_ - Realizuje překlad MAC adresy na IP adresu

=== Pro stahování binárních souborů z Internetu se běžně používají tyto protokoly
- _true_ - HTTP
- _true_ - FTP
- _true_ - HTTPS
- _false_ - BOOTP
- _false_ - DHCP
- _false_ - SNMP

=== Jednoznačnou IP adresu (Ipv4) může stanice získat následujícím způsobem
- _true_ - Pomocí protokolu DHCP
- _true_ - Protokolem BOOTP
- _false_ - Pomocí protokolu HTTP
- _false_ - Protokolem ICMP (IP address request)
- _false_ - Pomocí protokolu ARP
- _false_ - Od nejbližšího DNS serveru nalezeného pomocí zprávy vyslané broadcastem

=== V hlavičce protokolu TCP jsou obsaženy následující položky
- _true_ - Bitový příznak FIN, požadující ukončení komunikace v jednom směru
- _true_ - Bitový příznak RST, který vynucuje ukončení spojení v obou směrech
- _true_ - Bitový příznak SYN, který se používá při navazování spojení
- _true_ - Pole určující aktuální šířku přijímacího okénka
- _false_ - Bitový příznak NAK určující, že se jedná o negativní potvrzení
- _false_ - Bitový příznak NOP, definující, že se jedná o paket, udržující spojení (keep-alive)

=== Které z následujících tvrzení jsou pravdivá o protokolu HTTP ?
- _true_ - Je postaven na architektuře client-server
- _true_ - Je provozován nad transportním protokolem TCP.
- _false_ - Slouží pro získání IP adresy, při znalosti MAC adresy.
- _false_ - Je provozován nad transportním protokolem UDP.
- _false_ - Používá se pro šifrovaný přenos WWW stránek
- _false_ - Využívá se pro ohlašování chyb a zvláštních stavů při přenosu paketů.

=== Metoda Sliding window (plovoucí okénko)
- _true_ - Ve variantě GO-BACK-N požaduje retransmisi paketů od prvního ztraceného
- _true_ - Používá na odesílající straně okénka zaslané pakety
- _true_ - Po vypršení časového limitu ve variantě GO-BACK-N znovu posílá všechny dosud nepotvrzené pakety
- _false_ - Je použita pro přenos dat na internetu protokolem UDP
- _false_ - Udržuje v přijímacím okénku dosud nepotvrzené pakety.
- _false_ - Vždy vyžaduje zasílání negativních potvrzení (NAK)

=== V TCP segmentu se zdrojovou adresou 10.0.1.10 a cílovou adresou 10.0.2.20 je nastaven příznak RST dochází k:
- _true_ - Jednosměrnému ukončení z 10.0.1.10
- _false_ - Násilnému ukončení spojení (oboustranně)
- _false_ - Jednosměrnému ukončení z 10.0.2.20
- _false_ - Upozornění na poškození

=== Příkladem protokolů 7 vrstvy modelu RM OSI (celá kombinace)
- _true_ - DNS, HTTP, TFTP
- _false_ - TFTP, HTTP, FTP, ICMP
- _false_ - TCP a UDP
- _false_ - IP a IPX

=== Protokol TFTP
- _true_ - Umožňuje stanicím stáhnout soubor pro start OS ze serveru
- _true_ - Umožňuje nahrávat soubor na server
- _true_ - Používá potvrzovacího schématu stop-and-wait
- _false_ - Poskytuje masku podsítě
- _false_ - Vyžaduje uživatelské jméno a heslo pro autentizaci
- _false_ - Využívá protokol TCP

=== Protokol pro služby WWW
- _true_ - Ve verzi HTTP 1.1 více dokumentů v 1 spojení
- _true_ - K šifrování dat ve verzi 1.0 i 1.1 je třeba HTTPS
- _false_ - Ve verzi HTTP 1.0 data šifruje
- _false_ - Ve verzi HTTP 1.1 data šifruje
- _false_ - Ve verzi HTTP 1.0 více dokumentů v 1 spojení
- _false_ - Umožňuje přenos binárních dat až od verze 1.1

=== User Datagram Protokol (UDP) 
- _true_ - Je používán při přenosu dat nepotvrzovanou datovou službou 
- _true_ - V hlavičce obsahuje pole kontrolního součtu 
- _false_ - Je protokol druhé vrstvy 
- _false_ - Vždy zajišťuje spolehlivý přenos dat sítí 
- _false_ - V hlavičce obsahuje číslo zdrojového a cílového portu. Tyto položky však nejsou povinné a nemusí být použity 
- _false_ - Používá se pouze pro přenos zvuku v IP sítích. 

=== Která tvrzení z oblasti bezpečnosti sítí jsou platná? 
- _true_ - IPSec zajišťuje šifrování na 3.vrstvě OSI RM 
- _true_ - Šifrování může být technicky realizováno i na více vrstvách OSI RM současně
- Asi ano -  Při asymetrickém šifrování lze šifrovat privátním klíčem a dešifrovat veřejným nebo opačně
- _false_ - Šifrování se v praxi realizuje výhradně na prezentační vrstvě 
- _false_ - Vrstva SSL zajišťuje šifrování na 2.vrstvě OSI RM 
- _false_ - Pro šifrování provozu v Internetu je nejefektivnější šifrování na 2.vrstvě OSI RM 





















