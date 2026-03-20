#import "utilities.typ": blockquote

#let chapter(
  id: none,
  number: 1,
  title: none,
  summary: none,
  start_notes: none,
  text,
  end_notes: none,
) = [
  #heading(level: 1)[
    #if title != none [
      Chapter #number: #title
    ] else [
      Chapter #number
    ]
  ]

  #if summary != none [
    #blockquote([Summary:], summary)
  ]
  #if start_notes != none [
    #blockquote([Notes:], start_notes)
  ]
  #text
  #if end_notes != none [
    #blockquote([Notes:], end_notes)
  ]
]

#let story(
  summary: none,
  start_notes: none,
  chapters: (:),
  end_notes: none,
) = [
  #if start_notes != none [
    #page[#blockquote([Notes:], start_notes)]
  ]
  #for chapter in chapters [
    #chapter
    #pagebreak(weak: true, to: "odd")
  ]
  #if end_notes != none [
    #blockquote([Notes:], end_notes)
  ]
]
