#let tags(
  rating: "Not Rated",
  warnings: ("No Archive Warnings Apply"),
  categories: (),
  fandoms: ("Original"),
  relationships: (),
  characters: (),
  tags: (),
) = [
  #terms.item([Rating], rating)
  #terms.item([Archive Warnings], warnings.join(", "))
  #if categories.len() > 0 [#terms.item([Category], categories.join(", "))]
  #terms.item([Fandoms], fandoms.join(", "))
  #if relationships.len() > 0 [#terms.item([Relationships], relationships.join(", "))]
  #if characters.len() > 0 [#terms.item([Characters], characters.join(", "))]
  #if tags.len() > 0 [#terms.item([Additional Tags], tags.join(", "))]
]

#let associations(
  language: "English",
  series: (),
  collections: (),
) = []

#let stats(
  published: datetime.today(),
  updated: datetime.today(),
  words: 0,
  chapters: 1,
  expected: none,
  comments: 0,
  kudos: 0,
  bookmarks: 0,
  hits: 0,
) = [
  #terms.item([Stats], [
    Published: #published.display() #h(1em)
    Updated: #updated.display() #h(1em)
    Words: #words #h(1em)
    Chapters: #chapters/#if expected != none [#expected #h(1em)] else [? #h(1em)]
    #if comments > 0 [Comments: #comments #h(1em)]
    #if kudos > 0 [Kudos: #kudos #h(1em)]
    #if bookmarks > 0 [Bookmarks: #bookmarks #h(1em)]
    Hits: #hits
])
]

#let metadata(
  tags: tags.with(),
  associations: associations.with(),
  stats: stats.with(),
) = [
  #tags

  #associations

  #stats

  #pagebreak(weak: true, to: "odd")
]
