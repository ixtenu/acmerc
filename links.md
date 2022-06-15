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

Scripts, resources, documentation:

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

Acme has [many forks](https://github.com/9fans/plan9port/network/members);
below is a curated list of forks which implemented something useful.

- [1g0rb0hm/plan9labs](https://github.com/1g0rb0hm/plan9labs): implements tab
  expansion (controlled by extensions to the `Indent` command: looks like it's
  done properly) and a MacOS keyboard shortcut, Command-S to `Putall`.
- [dexen/plan9port](https://github.com/dexen/plan9port): implements several
  arguably useful changes: Ctrl-S to `Putall`, add `Edit ,d` to `+Error`
  windows, remove `Look` from the default window tag bar, and more.
- [eaburns/plan9port](https://github.com/eaburns/plan9port/tree/eaburns):
  implements CUA key bindings, changes the Acme colors, and tweaks the
  windowing growing behavior after a `Del`.
- [karahobny/acme2k](https://github.com/karahobny/acme2k): implements
  compile-time color themes with a suckless-style config.h and CUA-style
  keyboard shortcuts.  [acme-dark-theme.patch](./acme-dark-theme.patch) was
  extracted from here.
- [karahobny/plan9port](https://github.com/karahobny/plan9port): implements CUA
  key bindings and cursor movement with the up/down keys.
- [lmumar/plan9port](https://github.com/lmumar/plan9port): implements CUA
  keybindings and cursor movement with up/down or Ctrl-n/p; also includes the
  acme2k color theme.
- [mk-f/plan9port](https://github.com/mk-f/plan9port): implements supports
  for specifying the custom color theme in `argv` (from mariusae), adds
  `Edit` to the default tag bar and disables multi-line tags, implements tab
  expansion (controlled by a new `Spaces` command: based on the 9front Acme
  implementation[^spewspc]; and, uniquely, can also be controlled via 9p),
  and more.
- [mkhl/plan9port](https://github.com/mkhl/plan9port): implements macOS
  inertial scrolling, tab expansion (the 9front `Spaces` implementation),
  running an `acme.rc` script prior to external commands, specifying a font for
  the tag bar (rather than using the primary font), and more.
- [omar-polo/plan9port](https://github.com/omar-polo/plan9port): implements tab
  expansion (the 9front `Spaces` implementation), CUA key bindings, and changes
  the default `Tab` value from 4 to 8.
- [prodhe/plan9port](https://github.com/prodhe/plan9port): implements a
  `Tabexpand` command (the underlying implementation is not as good as some of
  the others on this list), Ctrl-a and Ctrl-e move to the previous/next line if
  already at the beginning/end of current line, Ctrl-p and Ctrl-n to move the
  cursor up/down a line, and Command-S to `Put`.
- [rjkroege/plan9port](https://github.com/rjkroege/plan9port/tree/acme-dev):
  implements some Emacs key bindings, mandatory tab expansion (cannot be
  disabled), and changes the color scheme.  Notable mostly since rjkroege
  is also the author of [Edwood](https://github.com/rjkroege/edwood).
- [sminez/plan9port](https://github.com/sminez/plan9port): implements CUA
  keybindings, a `Tabexpand` command (same as prodhe's), and changes the
  default font and color scheme.
- [TobiasHeinicke/plan9port](https://github.com/TobiasHeinicke/plan9port):
  implements numerous interesting features: a `Nav` command, which causes
  directory windows to be reused when opening a new directory; a `Dotfiles`
  command, which toggles whether directory windows show dotfiles (hidden by
  default); a `Clear` command, a convenient alternative to `Edit ,d`; and more.

[^spewspc]: See 9front commit [4757debd0b](https://git.9front.org/plan9front/plan9front/4757debd0b5935dae94944c35c3cac74b14aa209/commit.html).

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
