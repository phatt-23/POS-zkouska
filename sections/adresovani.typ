#set page(
  header: align(right)[
    _Adresování_
  ]
)
= Adresování

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == #highlight[IPv4 adresy]

    - Mají *32 bitů*
    - Jsou zapsány jako čtyři desítkové hodnoty oddělené tečkami (`192.168.1.1`)
    - Skládají se z *části pro síť* a *části pro zařízení*

    === Speciální zarezervované IPv4 adresy
    - *Privátní sítě* - `10.0.0.0`, `172.16.0.0`, `192.168.0.0`
    - *Loopback* - `127.0.0.1`
    - *Broadcast* - `255.255.255.255`

    == #highlight[MAC adresy]
    - Mají *48 bitů*
    - *Jedinečný* identifikátor přiřazený každému 
      fyzickému zařízení v síti, které podporuje síťové připojení
    - Jsou zapsány v hexadecimálním formátu (`0:1A:2B:3C:4D:5E`)
    - *První tři oktety jsou ID výrobce, zbylé tři jsou sériové číslo*

    === Speciální zarezervované MAC adresy
    - *Broadcast* - `FF:FF:FF:FF:FF:FF`
  ],
  [],
  [
    == #highlight[IPv6 adresy]
    - Mají *128 bitů*
    - Jsou zapsány v hexadecimálním formátu (`2001::8a2e:0370:7334`)
    - *Sekvence nul *může být zkrácena pomocí `::`, ale jen jednou v adrese
    - Nemají broadcasty - využívají *multicasty* místo broadcastů
    - *SLAAC* (Stateless Address AutoConfiguration) - *automatické přidělování adres* na základě prefixu zadaného routerem a MAC adresou zařízení

    === Speciální zarezervované IPv6 adresy
    - Loopback - `::1/128`
    - Unspecified - `::/128`

    == #highlight[Porty - adresy služeb, procesů]
    - Porty identifikují jednotlivé služby nebo procesy na síťovém zařízení
    - Číslo portu je *16bitové* (*0-65535*)
    - Využívá se pro protokoly *TCP* a *UDP*
  ],
)

== Speciální zarezervované porty

- *FTP* - 20 (přenos dat), 21 (komunikace mezi klientem a serverem)
- *SSH* - 22
- *Telnet* - 23
- *SMTP* - 25
- *DNS* - 53
- *DHCP* - 67 (server), 68 (klient)
- *HTTP* - 80
- *HTTPS* - 443
- *POP3* - 110
- *IMAP* - 143
