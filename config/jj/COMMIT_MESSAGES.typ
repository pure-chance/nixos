= Spec

Commits messages follow the #link("https://www.conventionalcommits.org/en/v1.0.0/")[Conventional Commits] unless otherwise specified. Reference #link("https://cbea.ms/git-commit/")[How to Write a Git Commit Message] for how to actually write a good commit message (not style).

- The `description` should be lowercase and not include a period
- All breaking change should have a ! after `type` (and `scope`) _in addition_ to a breaking change footer
- All footers (except breaking change) are kebab-case and are followed by a colon.
- Footers are grouped by the following types with a blank line between each: issues, authors, breaking change.

= Example

```txt
refactor(cli)!: modify how the configuration file is parsed

The cli previously parsed the configuration files with only a single tactic, which limits the configuration options. With the ability to run a strategy where voters have a distribution of potential strategies (#102), the cli should be modified to capture this configuration.

closes: #124
refs: #102
see-also: #90

co-authored-by: Alice Kendall <a.kendall@gmail.com>, Bob Tao <bob.tao@yahoo.com>
reviewed-by: Chalie Strohm <c.strohm@gmail.com>

BREAKING CHANGE: The cli now requires that all strategies are an array of tactics, probability pairs. If you want to keep only 1 tactic, simply populate the array with that tactic and probability 1.0.
```
