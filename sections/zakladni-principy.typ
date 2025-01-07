#set page(
  header: align(right)[
    _Základní principy přenosu dat_
  ]
)

= Základní principy přenosu dat 

=== Dělení podle směru přenosu:
- #highlight[*Simplex*] - data se přenášejí pouze *jedním* směrem, jeden kanál pro přenos (TV)
- #highlight[*Half duplex*] - přenos střídavě v *obou* směrech, pouze jeden směr najednou. Pro přenos stačí jeden kanál (vysílačka)
- #highlight[*Full duplex*] - obě strany mohou komunikovat *současně*, musí být dva nezávislé kanály (Ethernet)

== Paralelní a sériová komunikace
=== Rozdělení podle typu přenosu:

- #highlight[*Paralelní*] - více bitů je přenášeno *současně*, je dražší a komplikovanější na synchronizaci
- #highlight[*Sériová*] - v dnešní době standardem, kvůli nižším nákladům a jednodušší konstrukci kabelů

=== Rozdělení podle způsobu synchronizace:
- #highlight[*Asynchronní*] - přenáší znaky jeden po druhém s jednotlivými stop bity a možností kontroly parity (klávesnice)
- #highlight[*Synchronní*] - data se přenáší ve formě *rámců* s hlavičkou, kontrolními součty a bez nutnosti synchronizace pro každý znak. Vhodné pro vysokorychlostní přenos, synchronizace probíhá na začátku bloku, takže ji není potřeba neustále obnovovat

== Přenosová média a modulace signálu
- #highlight[*Fyzické vlastnosti signálu*] - data se přenáší prostřednictvím *signálu* (napětí, intenzita světla...) který nese informace. Tyto signály ale mohou být ovlivněny *šumem* a útlumem prostředí
- #highlight[*Typy médií*] - optická vlákna, kroucená dvojlinka a koaxiální kabely

=== Modulace signálu

- #highlight[*AM*] (Amplitude Modulation) - změna *amplitudy* nosného signálu podle dat
- #highlight[*FM*] (Frequency Modulation) - změna *frekvence* nosného signálu podle dat
- #highlight[*PM*] (Phase modulation) - změna *fáze* signálu, aby nesl informace

#pagebreak()

== Přenosová metoda Baseband

- Přenáší data v původní frekvenční oblasti *bez modulace*
- Data mohou využívat celé frekvenční pásmo pro sebe, *nevyužívají* různé kanály #sym.arrow nedělí médium pro více uživatelů
- Pro *LAN*, *WAN*, *Ethernet*

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    #highlight[*Non Return to Zero (NRZ)*]
    - Kvůli absenci neutrální hodnoty nelze toto kódování použít pro synchronní přenosy
    - 0 #sym.arrow nízká úroveň
    - 1 #sym.arrow vysoká úroveň

    #figure(
      image("../images/image.png"),
    )

    #highlight[*Non Return to Zero Inverted (NRZI)*]
    - 0 #sym.arrow úroveň signálu zůstává
    - 1 #sym.arrow inverze signálu

    #figure(
      image("../images/image (1).png"),
    )
    #highlight[*Manchester*]
    - Každý bit je reprezentován změnou uprostřed bitového intervalu
    - 0 #sym.arrow přechod z nízké na vysokou úroveň
    - 1 #sym.arrow přechod z vysoké na nízkou úroveň

    #figure(
      image("../images/image (2).png"),
    )
  ],
  [],
  [
    #highlight[*Diferenciální Manchester*]
    - 0 #sym.arrow změna
    - 1 #sym.arrow beze změny

    #figure(
      image("../images/image (3).png"),
    )

    #highlight[*Alternate Mark Inversion (AMI)*]
    - 3 úrovně amplitudy signálu (-1, 0, +1)
    - Problém při dlouhých posloupnostech nul
    - 0 #sym.arrow nulová hodnota
    - 1 #sym.arrow střídavě +1 a -1

    #figure(
      image("../images/image (4).png"),
    )

    #highlight[*4B5B*]
    - Každé *4 bity* mají pevně danou *kombinaci 5 bitů*
    - Datový tok se tím pádem zvýší o 25 %
    - Každá kombinace 5 bitů má alespoň 2x 1 #sym.arrow *nenastanou dlouhé posloupnosti nul*
  ]
)

== Přenosová metoda Broadband
- Rozdělí šířku pásma na více kanálu
- Umožní tím více komunikací současně
- Využívá se například pro mobilní sítě (4G, 5G), Wi-Fi, optické sítě...



