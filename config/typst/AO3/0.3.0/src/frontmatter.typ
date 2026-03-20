#let title-page(title, authors) = {
  page[
    #set align(center)
    #v(25%)

    #text(size: 25pt)[#title]
    #v(2em)

    #text(size: 15pt)[#authors.join(",")]
  ]
}
