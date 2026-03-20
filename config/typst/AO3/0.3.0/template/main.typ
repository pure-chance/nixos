#import "@preview/AO3:0.3.0": work

#let metadata = toml("./polluted_marrow/polluted_marrow.toml").frontmatter
#let story = include("./polluted_marrow/polluted_marrow.typ")

#show: work(
  metadata,
  story,
)
