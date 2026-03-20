#let numberize(n) = {
    let s = str(n)
    let groups = ()
    for i in range(s.len() - 3, -1, step: -3) {
        groups.push(s.slice(i, i + 3))
    }
    groups.rev().join(",")
}

#let parse-metadata(metadata) = {
  // heading
  heading(level: 1)[Info]

  block(fill: color.rgb("#40a02b").lighten(80%), inset: 8pt, radius: 4pt)[
  // tags
  #let tags = (
    "Rating:": metadata.tags.rating,
    "Archive Warnings:": metadata.tags.warnings.join(", "),
    "Category:": metadata.tags.categories.join(", "),
    "Fandoms:": metadata.tags.fandoms.join(", "),
    "Relationships:": metadata.tags.relationships.join(", "),
    "Characters:": metadata.tags.characters.join(", "),
    "Additional Tags:": metadata.tags.additional.join(", "),
  )
  #for (tag, value) in tags {
    if value != none {
      terms.item(tag, value)
    }
  }
  #v(1em)

  // associations
  #let associations = (
    "Language": metadata.associations.language,
    "Series": metadata.associations.series.join(", "),
    "Collections": metadata.associations.collections.join(", "),
  )
  #for (tag, value) in associations {
    if value != none {
      terms.item(tag, value)
    }
  }
  #v(1em)

  // stats
  #let stats = (
    "Published": metadata.stats.published.display(),
    "Updated": metadata.stats.updated.display(),
    "Words": [#numberize(metadata.stats.words)],
    "Chapters": [#metadata.stats.chapters],
    "Comments": [#numberize(metadata.stats.comments)],
    "Kudos": [#numberize(metadata.stats.kudos)],
    "Bookmarks": [#numberize(metadata.stats.bookmarks)],
    "Hits": [#numberize(metadata.stats.hits)],
  )
  #terms.item("Stats", stats.pairs().map(it => it.at(0) + ": " + it.at(1)).join(", "))

  ]
}

