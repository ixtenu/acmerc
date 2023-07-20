# Acme Resources

Notes and supporting files for the Acme text editor, specifically the version
of Acme from [plan9port](https://9fans.github.io/plan9port/).

## Documents

- [setup.md](setup.md): Setting up Acme on a Unix(-like) system.
- [setup-wsl.md](setup-wsl.md): Getting WSL ready (viz., X11 support) for
  plan9port.
- [tools.md](tools.md): Notes on complementary software tools.
- [hardware.md](hardware.md): Hardware (mice and keyboards) that are best when
  using Acme.
- [links.md](links.md): Collection of Acme-related links.

## Scripts

- [bin/9a](bin/9a) is an Acme launch script.  There are many like it, but this
  one is mine.
- [bin/9s](bin/9s) is a Sam launch script.  Sam is the other text editor in
  plan9port, older and simpler.
- [install.sh](install.sh) creates symlinks for `9a` and `9s` in `$HOME/bin`.
- [bin/Getall](bin/Getall) is a script to execute `Get` on all non-dirty
  windows (the inverse of the built-in `Putall` command, which executes `Put`
  on all dirty windows).  Useful after an operation like `git pull` has updated
  many open files.
- [bin/Clear](bin/Clear) clears the buffer for the current window.  This is
  equivalent to an `Edit ,d` command, but because `Clear` is one word it can be
  executed without selecting it first.

## Miscellaneous

- [rulers](rulers): Acme does not display a column number for the cursor, which
  makes it awkward to adhere to programming style guides [that recommend][wcpl]
  limiting the number of characters per line.  One solution ([suggested by Russ
  Cox][rsc]) is to place a ruler file (such as those in the linked directory)
  above the edited window which provides a visual guide to when a line is too
  long (assuming both windows are using the monospaced font).
- [editcmd](editcmd): useful arguments to the `Edit` command.

[wcpl]: https://en.wikipedia.org/wiki/Characters_per_line#In_programming
[rsc]: https://marc.info/?l=9fans&m=121916884525962&w=2

## See also

- [ixtenu/plan9port](https://github.com/ixtenu/plan9port): my fork of plan9port
  with some minor Acme customizations.  Specifically, a black-and-gray color
  scheme, support for expanding tabs to spaces, and a few additional CUA-style
  key bindings.
- [ixtenu/script](https://github.com/ixtenu/script): has several scripts that
  are useful within Acme (and elsewhere, which is why they are not in this
  repository).
