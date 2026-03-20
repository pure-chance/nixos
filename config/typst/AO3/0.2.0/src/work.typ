#import "metadata.typ": metadata
#import "story.typ": story
#import "styles.typ": styles

#let work(
  id: 0,
  title: [],
  authors: (:),
  summary: [],
  frontmatter,
  matter,
) = {
  // metadata --
  set document(title: title, author: authors)

  // styles --
  show: styles

  // cover page --
  page(align(left+horizon, block(width: 95%)[
    #par(justify: false, text(25pt)[*#title*])
    #v(2em, weak: true)
    #par(leading: 0em, first-line-indent: 0em, text(18pt)[#authors.join(", ")])
    #if summary != none {
      v(2em, weak: true)
      block(width: 80%)[
        #summary
      ]
    }
  ]),
  )

  // metadata --
  metadata

  // story --
  story
}
