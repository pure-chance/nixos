#let blockquote(title, body) = [
  #show par: set align(left)
  #align(center, block(width: 90%,)[
    #set align(left)
    #heading(level: 2)[#title]
    #line(length: 100%, stroke: 0.6pt)
    #set align(center)
    #block(width: 95%)[#body]
  ])
  #v(2em)
]

#let scene-break() = [
  #set align(center)
  #block(inset: 2em)[--- + ---]
]
