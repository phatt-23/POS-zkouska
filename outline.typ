#import "@preview/outrageous:0.1.0"

#v(3em)

#set outline(depth: 1)
#show outline.entry: outrageous.show-entry.with(
  ..outrageous.presets.typst,
  font-style: ("italic", auto),
  fill: (
    line(length: 100%, stroke: gray + .5pt),
    line(length: 100%, stroke: gray + .5pt),
  ),
)

#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  it
}

#box(
  inset: (6em),
)[
  #outline(
    indent: auto,
    title: [
      #text(size: 32pt)[Obsah]
      #v(2em)
    ]
  )
]


