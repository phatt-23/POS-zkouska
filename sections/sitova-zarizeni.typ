#set page(
  header: align(right)[
    _Síťová zařízení_
  ]
)

= Síťová zařízení // 📟

== #highlight[HUB]
- Funguje na *fyzické* vrstvě (*L1*)
- Jednoduché zařízení, které *pouze přeposílá data všem připojeným zařízením*
- *Mohou vznikat kolize*

== #highlight[Bridge]
- Funguje na *linkové* vrstvě (*L2*)
- Spojuje dvě nebo více sítí a zároveň filtruje provoz na základě MAC adres
- Slouží jako přepínač, udržuje si tabulku MAC adres
- Posílá rámce pouze tam, kde se nachází cílové zařízení
- Mohou vzniknout kolize, ale jen uvnitř daných segmentů

== #highlight[Switch (přepínač)]
- Fungují na *linkové* vrstvě (*L2*)
- Hlavní výhodou je schopnost *přepínat data mezi segmenty bez kolizí*
- Switche využívají *CAM tabulku* (Content Addressable Memory), která uchovává *MAC adresu* a přiřadí si ji k portu
- Díky této tabulce mají také lepší *bezpečnost* - data jdou pouze tam, kam mají (po naučení CAM tabulky)
- Každý port může fungovat v jiném módu (*half duplex*, *full duplex*)
- *Ve full duplex režimu nevznikají kolize*

== #highlight[Router (směrovač)]
- Funguje na *síťové* vrstvě (*L3*)
- Směrovací zařízení, které *propojuje sítě*
- Umožňuje propojit různé sítě, používá *IP adresy* k předání dat na správné místo
- Routery mohou být nakonfigurovány ručně (*statické směrování*), nebo automaticky (*dynamické směrování*) například pomocí *OSPF* nebo *RIP*
- Mají další funkce jako například *NAT*, *VPN*, *Firewall*
- *Kolize zde vzniknout nemohou*


