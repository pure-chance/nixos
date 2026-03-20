// ----------------------------------------------------------------------------
// Functions
#let blockquote(title, body) = [
  #show par: set align(left)
  #align(center, block(
    width: 90%, 
  )[
    #block(inset: 2%)[#text(1.25em)[*#title*]]
    #line(length: 100%)
    #align(center, block(width: 95%, inset: 5pt)[#body])
  ])
  #v(2em)
]

#let dict-to-dl(dict) = {
  dict.pairs().filter(it => it.at(1) != none).map(it => {(
      [*#it.at(0)*], 
      if type(it.at(1)) == array {
        [#it.at(1).join(", ")]
      } else {
        [#it.at(1)]
      }).join(": ")
  }).join("\n")
}

#let stats-to-tsv(dict) = {
  let stats-revised = (
    // Published
    Published: dict.at("Published"),
  )
  // Updated / Completed / None
  if dict.at("Nchapters") > 1 {
    if dict.at("Completed") and dict.at("Nchapters") == dict.at("Expected") {
      stats-revised.insert("Completed", dict.at("Modified").display())
    } else {
      stats-revised.insert("Updated", dict.at("Modified").display())
    }
  }
  // Words
  stats-revised.insert("Words", dict.at("Words"))
  // Chapters
  if dict.at("Expected") == none {
    stats-revised.insert(
      "Chapters", 
      (str(dict.at("Nchapters")), "?"
    ).join("/"))
  } else {
    stats-revised.insert("Chapters", (
      str(dict.at("Nchapters")), 
      str(dict.at("Expected"))
    ).join("/"))
  }
  // Comments
  if dict.at("Comments") != none {
    stats-revised.insert("Comments", dict.at("Comments"))
  }
  // Kudos
  if dict.at("Kudos") != none {
    stats-revised.insert("Kudos", dict.at("Kudos"))
  }
  // Bookmarks
  if dict.at("Bookmarks") != none {
    stats-revised.insert("Bookmarks", dict.at("Bookmarks"))
  }
  // Hits
  stats-revised.insert("Hits", dict.at("Hits"))
  // Make tsv
  stats-revised.pairs().map(it => {(
      [#it.at(0)], 
      if type(it.at(1)) == array {
        it.at(1).join(", ")
      } else if type(it.at(1)) == datetime {
        str(it.at(1).display())
      } else {
        str(it.at(1))
      }).join(": ")
  }).join("  ")
}

#let sb = [
  // #h(1fr) #align(center, par()[#body]) #h(1fr)
  #align(center, block(above: 2em, below: 2em)[#line(length: 50%)])
]

// ----------------------------------------------------------------------------
// Chapter template
#let chapter(
  title: [],
  summary: none,
  start_notes: none,
  end_notes: none
) = (chapter) => [
  #if title != none {
    heading(title)
  }
  #if summary != none {
    blockquote("Summary", summary)
  }
  #if start_notes != none {
    blockquote("Notes", start_notes)
  }
  #chapter
  #if end_notes != none {
    blockquote("Notes", end_notes)
  }
]

// ----------------------------------------------------------------------------
// Work template
#let work(
  title: [Title],
  authors: (),
  summary: none,
  notes: none,
  end_notes: none,
  outline: outline(),
  keywords: (),
  tags: (
    "Rating": "Not Rated", // str
    "Warnings": ("Creator Chose Not To Use Archive Warnings",), // (str, )
    "Categories": none, // (str,)
    "Fandoms": none, // (str,)
    "Relationships": none, // (str,)
    "Characters": none, // (str,)
    "Additional Tags": none, // (str,)
  ),
  associations: (
    "langauge": "English",
    "series": none,
    "collections": none,
  ),
  stats: (
    "Published": datetime,
    "Modified": datetime,
    "Words": int,
    "Nchapters": int,
    "Expected": none,
    "Completed": bool,
    "Comments": none,
    "Kudos": none,
    "Bookmarks": none,
    "Hits": int,
  ),
) = (work) => {

  // --------------------------------------------------------------------------
  // Metadata
  set document(title: title, author: authors, keywords: keywords)

  set page(
    paper: "a5", 
    margin: (inside: 2.0cm, outside: 2.0cm, top: 12%, bottom: 8%),
    numbering: "1.",
    header-ascent: 2.0em
  )
  
  // --------------------------------------------------------------------------
  // Cover page
  page(align(left+horizon, block(width: 95%)[
    #let v-space = v(2em, weak: true)
    #text(2.5em)[*#title*]
    #v-space
    #par(leading: 0em, first-line-indent: 0em)[#text(1.6em)[#authors.join(", ")]]
    #if summary != none {
      v-space
      block(width: 80%)[
        #par(justify: true, linebreaks: "optimized", summary)
      ]
    }
  ]),
  numbering: none)

  // --------------------------------------------------------------------------
  // Text
  set text(size: 10pt, weight: 450)
  set block(spacing: 1em)
  set par(
    leading: 0.7em, 
    spacing: 0.7em,
    justify: true, 
    linebreaks: "optimized", 
    first-line-indent: 1.0em
  )
  show par: set block(spacing: 1.0em)
  // show par: set align(left)

  // --------------------------------------------------------------------------
  // Page setup (header & footer)
  set page(
    header: context {
      show par: set align(center)
      set text(size: 10pt)
      if here().page() > 1 {
        if (calc.even(here().page())) {
          smallcaps(title)
        } else {
          let target = heading.where(level: 1)
          let before = query(target.before(here()))
          if before.len() > 0 {
            let current = before.last()
            align(center)[#smallcaps(current.body)]
          } else {
            // if we can't find chapter, then just display title
            align(center)[#smallcaps(title)]
          }
        }
      }
    },
    footer: context {
      show par: set align(center)
      let i = counter(page).at(here()).first()
      par[#i]
    }
  )
  

  // --------------------------------------------------------------------------
  // Headings
  if outline != none {
    outline
    pagebreak()
  }
  
  // --------------------------------------------------------------------------
  // Headings
  set heading(numbering: "1.", offset: 0)
  show heading.where(level: 1): it => {
    colbreak(weak: true)
    it
  }
  show heading: set block(above: 1.5em, spacing: 1.2em)
  show heading.where(level: 1): set text(1.5em)
  show heading.where(level: 2): set text(1.4em)
  show heading.where(level: 3): set text(1.3em)
  show heading.where(level: 4): set text(1.2em)
  show heading.where(level: 5): set text(1.1em)
  // show heading.where(level: 4): set block(above: 1.5em, below: 1em)
  // show heading.where(level:4): set text(weight: 450)
  // show heading.where(level: 4): set heading(numbering: none, outlined: false)
  // show heading.where(level: 5): set block(above: 1.5em, below: 1em)
  // show heading.where(level: 5): set text(weight: 450, style: "italic")
  // show heading.where(level: 5): set heading(numbering: none, outlined: false)
  set heading(supplement: [Sect.])

  // --------------------------------------------------------------------------
  // Lists
  show enum: set block(spacing: 1.5em)
  show list: set block(spacing: 1.5em)

  // --------------------------------------------------------------------------
  // Metadata
  par[
    #dict-to-dl(tags) \
    #dict-to-dl(associations) \
    #dict-to-dl((Stats: stats-to-tsv(stats)))
    #v(2em)
  ]

  // --------------------------------------------------------------------------
  // Main body
  if summary != none {
    blockquote("Summary", summary)
  }
  if notes != none {
    blockquote("Notes", notes)
  }
  work 
  if end_notes != none {
    blockquote("Notes", end_notes)
  }

}
   
  // par(justify: false)[
  //   #table(
  //     // stroke: none,
  //     inset: 7pt,
  //     columns: (auto,),
  //     // Tags
  //     [*Rating:* #tags.at("rating")],
  //     [*Archive Warning:* #tags.at("warnings").join(", ")],
  //     if tags.at("categories").len() > 0 [
  //       *Categories:* #tags.at("categories").join(", ")
  //     ],
  //     [*Fandoms:* #tags.at("fandoms").join(", ")],
  //     if tags.at("relationships").len() > 0 [
  //       *Relationships:* #tags.at("relationships").join(", ")
  //     ],
  //     if tags.at("characters").len() > 0 [
  //       *Characters:* #tags.at("characters").join(", ")
  //     ],
  //     if tags.at("tags").len() > 0 [
  //       *Additional Tags:* #tags.at("tags").join(", ")
  //     ],
  //     // Associations
  //     [*Language:* #associations.at("language")],
  //     if associations.at("series") != none [
  //       *Series:* #associations.at("series").join(", ")
  //     ],
  //     if associations.at("collections") != none [
  //       *Collections:* #associations.at("collections").join(", ")
  //     ],
  //     // Stats
  //     [*Stats:*
  //       Published: #stats.at("published").display() #h(5pt)
  //       #if stats.at("nchapters") > 1 {
  //         if (stats.at("completed") and 
  //           stats.at(nchapters) == stats.at(expected)) [
  //           Completed: #stats.at("modified").display()
  //         ] else [
  //           Updated: #stats.at("modified").display()
  //         ]
  //       } #h(5pt)
  //       Words: #stats.at("words") #h(5pt)
  //       #if stats.at("expected") == none [
  //         Chapters: #(str(stats.at("nchapters")), "?").join("/")
  //       ] else [
  //         Chapters: #(
  //           str(stats.at("nchapters")), 
  //           str(stats.at("expected"))
  //         ).join("/")
  //       ] #h(5pt)
  //       #if stats.at("comments") != none [
  //         Comments: #stats.at("comments")
  //       ] #h(5pt)
  //       #if stats.at("kudos") != none [
  //         Kudos: #stats.at("kudos")
  //       ] #h(5pt)
  //       #if stats.at("bookmarks") != none [
  //         Bookmarks: #stats.at("bookmarks")
  //       ] #h(5pt)
  //       Hits: #stats.at("hits")
  //     ]
  //   )
  // ]
