# Papers

- [Acme: A User Interface for Programmers](https://doc.cat-v.org/plan_9/4th_edition/papers/acme/).
  Rob Pike's paper describing the Acme text editor.
- [Help: A Minimalist Global User Interface](http://doc.cat-v.org/plan_9/1st_edition/help/).
  Rob Pike's paper describing a predecessor to Acme.
- [A Tutorial for the Sam Command Language](http://doc.cat-v.org/bell_labs/sam_lang_tutorial/).
  Rob Pike's tutorial for the Sam command language which Acme's
  `Edit` command uses.

# Web pages and blog posts

- [cat-v Acme Fansite](http://acme.cat-v.org/)
- [A Tour of Acme (2012)](https://research.swtch.com/acme)
- [The Tao of Acme (2022)](https://benghancock.github.io/blog/2022/tao-of-acme.html)
- [On using Acme as a day-to-day text editor (2013)](https://jlouisramblings.blogspot.com/2013/04/acme-as-editor_20.html)
- [Extensibility in the Acme text editor (2013)](https://mostlymaths.net/2013/03/extensibility-programming-acme-text-editor.html/)
- [John Floren's Tools page](https://jfloren.net/tools.html) has a
  section on Acme
- [How I program without syntax highlighting](https://hakon.gylterud.net/opinion/syntax-highlighting.html)
- Let's Try Acme (2014), parts
  [zero](https://echosa.net/blog/2014/06/18/lets-try-acme-ep-0-research/),
  [one](https://echosa.net/blog/2014/06/18/lets-try-acme-ep-1-hello/),
  [two](https://echosa.net/blog/2014/06/18/lets-try-acme-ep-2-wat/),
  [three](https://echosa.net/blog/2014/06/19/lets-try-acme-ep-3-problem-solving/),
  [four](https://echosa.net/blog/2014/06/26/lets-try-acme-ep-4-enough-messing-around/),
  [five](https://echosa.net/blog/2014/06/27/lets-try-acme-ep-5-well/),
  [six](https://echosa.net/blog/2014/07/07/lets-try-acme-episode-6-trouble-in-paradise/),
  [seven](https://echosa.net/blog/2014/08/07/lets-try-acme-episode-7-equilibrium/),
  [eight](https://echosa.net/blog/2014/08/26/lets-try-acme-episode-8-scrolling-and-plumbing/),
  and [nine](https://echosa.net/blog/2014/10/06/lets-try-acme-episode-9-the-end/)

# Acme-related Git repositories

- [jinyangustc/acme-editor](https://github.com/jinyangustc/acme-editor): an Acme
  setup repository.  Many relevant links in the README.
- [sminez/acme-corp](https://github.com/sminez/acme-corp): an Acme setup
  repository (fairly elaborate).
- [evbogdanov/acme](https://github.com/evbogdanov/acme): an Acme setup
  repository.
- [jlouis/plan9-setup](https://github.com/jlouis/plan9-setup): a plan9port setup
  repository.
- [jordilin/acmescripts](https://github.com/jordilin/acmescripts): Acme helper
  scripts.
- [mkmik/awesome-acme](https://github.com/mkmik/awesome-acme): links to
  Acme-related tools.
- [karahobny/acme2k](https://github.com/karahobny/acme2k): a slightly modified
  Acme fork.  [acme-dark-theme.patch](./acme-dark-theme.patch) was extracted
  from here.

# Related text editors

- [Edwood](https://github.com/rjkroege/edwood): Go port of and "drop-in
  replacement" for plan9port's Acme.  Has experimental support for
  running without plan9port's infrastructure.
- [A](https://github.com/as/a): Text editor written in Go and inspired
  by Acme.
  Not to be confused with [davidrjenni/A](https://github.com/davidrjenni/A).
- [Wily](http://www.cse.yorku.ca/~oz/wily/): An Acme-inspired editor for
  Unix; created in the 1990s, long before plan9port existed.  Newest
  release is from 2006.
- [Sam](http://sam.cat-v.org/): The text editor which Rob Pike wrote
  prior to Acme.  Originally a Unix text editor (for the Blit windowing
  system), later ported to Plan 9 and included in plan9port.  The Plan 9
  version was ported back to Unix/X11: a standalone version of that code,
  updated and extended with new features not found in other versions of
  Sam, is at [deadpixi/sam](https://github.com/deadpixi/sam).
- [QED](https://github.com/phonologus/QED) an updated version of Rob Pike's
  `qed` text editor, a line editor that was derived from Research Unix's
  `ed` editor.  `qed` was used to write Sam.
- [vis](https://github.com/martanne/vis): a terminal text editor which
  combines `vi`'s modal editing with the structural regular expressions
  used by Sam and Acme's `Edit` command.
- [sim](https://sim.ssnf.xyz/): a terminal text editor "heavily inspired"
  by Vim and Sam.
