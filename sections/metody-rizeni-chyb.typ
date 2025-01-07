#set page(
  header: align(right)[
    _Metody řízení chyb_
  ]
)

= Metody řízení chyb // ❌

=== Typy potvrzení:

- #highlight[*Pozitivní (ACK)*] - potvrzuje o *správném přijetí*, ale pokud se ztratí, blokuje odesílatele
- #highlight[*Negativní (NAK)*] - informuje o přijetí *poškozeného paketu*, ale nestačí k samostatnému řízení chyb

#v(2em)

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == Číslování paketů
    - Zajišťuje *správné pořadí* paketů
    - Umožňuje detekovat *chybějící pakety*
    - *Chrání před duplikáty* (např. při opětovném odeslání kvůli ztraceným ACK)

    == Časové limity pro opětovné odeslání
    - Řeší problém blokování při *ztrátě ACK* zavedením čekacího *časového limitu*

    === #highlight[Stop-and-Wait]
    - Odesílatel pošle jeden rámec a čeká na *ACK*
    - Při *vypršení timeoutu* se rámec odešle *znovu*
    - Neefektivní na kanálech s dlouhým zpožděním

    === #highlight[Pipelining]
    - Umožňuje odesílat *více rámců bez čekání na ACK jednotlivých rámců*
    - *ACK může potvrdit všechny rámce až do určitého pořadového čísla*
    - Plná efektivita je dosažitelná na *full-duplex* linkách
  ],
  [],
  [
    == Protokoly s posuvným oknem \ (Sliding Window Protocols)
    - Odesílatel může odeslat *více rámců bez čekání na ACK* (pipelining)
    - Maximální počet rámců je omezen *velikostí odesílacího okna*
    - Každý rámec má vlastní *timeout*

    === #highlight[Go-Back-N]
    - Přijímač zahodí *všechny* rámce následující po chybějícím
    - Jednoduchá implementace, ale plýtvá kapacitou sítě

    #figure(image("../images/go-back-n.png", width: 100%))

    === #highlight[Selective Repeat]
    - Přijímač ukládá správné rámce mimo pořadí
    - Přijímač *čeká na chybějící rámec* a předává data až po jeho přijetí
    - Úspornější na kapacitu sítě

    #figure(image("../images/selective.png", width: 100%))
  ],
)



