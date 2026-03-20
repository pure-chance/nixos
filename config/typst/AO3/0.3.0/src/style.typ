#import "@preview/hydra:0.6.1": hydra

#let stylize(title, authors) = contents => {
  // text --
  set text(font: ("Linux Libertine",), size: 11pt, weight: "regular")
  set par(
    justify: true, leading: 0.75em, spacing: 0.75em, first-line-indent: 1.5em,
  )
  show link: underline
  show link: set text(style: "oblique")

  // headings --
  set heading(numbering: none)
  show heading: set text(style: "italic", weight: "regular")
  show heading: set block(above: 2em, below: 1em)

  show heading.where(level: 1): set text(20pt)
  show heading.where(level: 1): it => {
    state("content.switch").update(false)
    pagebreak(weak: true, to:"odd")
    state("content.switch").update(true)

    v(4em)
    it
  }
  show heading.where(level: 2): set text(12pt)

  // page setup --
  set page(
    paper: "a5",
    margin: (inside: 2.5cm, outside: 2cm, top: 2.5cm, bottom: 2cm),
    header: context {
      let is-start-chapter = query(heading.where(level: 1))
        .map(it => it.location().page())
        .contains(here().page())
      if not state("content.switch", false).get() or is-start-chapter { return }
      if calc.odd(here().page()) {
        set align(right)
        smallcaps[#authors.join(", ")] + h(1em) + counter(page).display()
      } else {
        set align(left)
        counter(page).display() + h(1em) + smallcaps[#title]
      }
    },
  )

  contents
}
