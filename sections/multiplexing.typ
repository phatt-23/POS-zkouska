#set page(
  header: align(right)[
    _Multiplexing_
  ]
)

= Multiplexing

- Metoda, která umožňuje přenos *více komunikačních kanálů* přes *jedno sdílené médium*
- Když má médium dostatečně široké *pásmo* (kapacitu), můžeme jej rozdělit na *několik* kanálů najednou
- Využívá se v *telefonních sítích*, *televizním vysílání* apod.

#grid(
  columns: (1fr, 0.1fr, 1fr),
  [
    == #highlight[Frequency Division Mux (FDM)]
    - Rozdělení kanálů podle specifických *frekvencí*
    - Je vhodné pro *fixní počet uživatelů*, mezi jednotlivými kanály je potřeba ponechat *frekvenční mezery* kvůli rušení
    #figure(image("../images/fdm.png", width: 100%))

    == #highlight[Wave Division Mux (WDM)]
    - Speciální případ *FDM*
    - Využívá se pro *optické sítě*
    - Každý kanál má různou *vlnovou délku* (*barvu světla*), toto umožní více signálů přes jedno optické vlákno
    #figure(image("../images/wdm.png", width: 100%))
  ],
  [],
  [
    == #highlight[Time Division Mux (TDM)]
    - Každý kanál dostane přidělený *časový úsek*, kdy může vysílat
    - Může to být neefektivní, pokud nejsou všechny kanály využívány stále

    == #highlight[Statistical Mux]
    - Data se přenáší v *proměnlivých intervalech* (bursty)
    - Přidělení pásma závisí na aktuální potřebě jednotlivých kanálů, každý dostane jiný prostor a čas
    - Data jsou rozdělena do *paketů* nebo buněk s hlavičkami, které obsahují informace o zdroji a cíli
    - Je to ideální v případě, kdy není provoz stabilní a zařízení často posílají data *nepravidelně* (bursty)
    - Například při prohlížení internetu - *chvíli ano* (stahování stránky) a *chvíli ne* (čtení stránky)
    - Vhodné pro *Wi-Fi*
  ]
)

