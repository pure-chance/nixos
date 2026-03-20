#let story(
  summary: none,
  start_notes: none,
  ..chapters,
  end_notes: none
) = {
  if summary != none [
    == Summary
    #quote(block:true)[#summary] ]

  if start_notes != none [
    == Notes
    #quote(block:true)[#start_notes]
  ]

  chapters.pos().join(linebreak())

  if end_notes != none [
    == Notes
    #quote(block:true)[#end_notes]
  ]
}

#let chapter(
  title: none,
  summary: none,
  start_notes: none,
  content,
  end_notes: none
) = {
  heading(level:1)[#title]
  linebreak()
  content
}
