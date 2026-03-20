#import "./frontmatter.typ": title-page
#import "./metadata.typ": parse-metadata
#import "./story.typ": story
#import "style.typ": stylize

#let work(metadata, story) = {
  // document metadata --
  set document(
    title: metadata.title,
    author: metadata.authors,
    date: metadata.stats.updated
  )

  // stylize --
  show: stylize(metadata.title, metadata.authors)

  // title page --
  title-page(metadata.title, metadata.authors)

  // metadata --
  parse-metadata(metadata)

  // story --
  story
}
