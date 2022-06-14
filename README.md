# Acme Resources

Notes and supporting files for the Acme text editor, specifically the version of
Acme from [plan9port](https://9fans.github.io/plan9port/).

## Documents

- [setup.md](setup.md): Setting up Acme on a Unix(-like) system.
- [tools.md](tools.md): Notes on complementary software tools.
- [hardware.md](hardware.md): Hardware (mice and keyboards) that are
  best when using Acme.
- [links.md](links.md): Collection of Acme-related links.

## Scripts

- [bin/9a](bin/9a) is an Acme launch script.  There are many like it, but this
  one is mine.
- [bin/9s](bin/9s) is a Sam launch script.  Sam is the other text editor in
  plan9port, older and simpler.
- [install.sh](install.sh) creates symlinks for `9a` and `9s` in `$HOME/bin`.
- [bin/Eput](bin/Eput) is a crude solution for expanding tabs to spaces in Acme.
- See also [ixtenu/script](https://github.com/ixtenu/script), which has several
  scripts that are useful within Acme (and elsewhere, which is why they are not
  in this repository).

## Patches

- [acme-dark-theme.patch](acme-dark-theme.patch): Acme's (in)famous yellow and
  blue color theme is not to everyone's tastes, but can be changed by lightly
  patching the source code.
- [acme-tab-expand.patch](acme-tab-expand.patch): Updates Acme to support
  expanding tabs to spaces.  See the explanatory text at the beginning of the
  patch for details.  __Warning__, this is experimental.
