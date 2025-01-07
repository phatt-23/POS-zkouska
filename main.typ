#import "@preview/tablex:0.0.6": gridx, hlinex, vlinex
#import "@preview/fontawesome:0.1.0": *

#set text(
  size: 10pt, 
  lang: "cs", 
  font: "Lato"
)

#set par(first-line-indent: 2em, justify: true)
#set page(paper: "us-letter")
#set highlight(
  fill: rgb(238, 238, 240), 
  extent: 2pt, 
  radius: 2pt,
  top-edge: 11pt,
  bottom-edge: -3pt,
)
#set list(spacing: 11pt)
#set image(width: 50%)
#set heading()

#align(horizon + center)[
  #text(size: 36pt, weight: "bold")[
    Počítačové sítě
  ]
]

#pagebreak()

#include "outline.typ"
#counter(page).update(0)

#set page(footer: [
  _Počítačové sítě_ 
  #h(1fr) 
  #counter(page).display("1 / 1", both: true)
])


#set page(margin: (left: 2cm, right: 2cm, top: 2cm, bottom: 2cm))
#set page(header: align(right)[_SET THE HEADER BRUH_])

#show heading.where(level: 1): it => {[
  #text(size: 1.6em)[#it.body]
  #line(length: 100%, stroke: (paint: gray, thickness: 2pt, cap: "round"))
  #v(0.5em)
]}

#let files = (
  "./sections/zakladni-principy.typ",
  "./sections/prenosova-media.typ",
  "./sections/lan-wan.typ",
  "./sections/mac-protokoly.typ",
  "./sections/sitova-zarizeni.typ",
  "./sections/multiplexing.typ",
  "./sections/ethernet.typ",
  "./sections/adresovani.typ",
  "./sections/tcp-ip.typ",
  "./sections/ieee-802.typ",
  "./sections/osi-rm.typ",
  "./sections/nat.typ",
  "./sections/metody-rizeni-chyb.typ",
  "./sections/smerovaci-algortimy.typ",
  "./sections/aplikacni-vrstva.typ",
  "./sections/dns.typ",
  "./sections/bezpecnost.typ",
  // "./druhy-test.typ",
)

#for file in files [
  #include file 
  #if file != files.last() [
    #pagebreak()
  ]
]

