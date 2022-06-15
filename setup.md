# Acme Text Editor Setup

## Install Plan 9 from User Space

[Plan 9 from User Space](https://9fans.github.io/plan9port/) (a.k.a. plan9port)
ports many programs from the Plan 9 operating system, including the Acme text
editor, to Unix-like operating systems.

Obtain plan9port.  While various packages exist (e.g., in FreeBSD, Homebew, and
the Arch Linux repositories), it is better to use the most up-to-date version,
which means compiling from source.

```sh
sudo mkdir /usr/local/plan9
sudo chown $(id -u -n):$(id -g -n) /usr/local/plan9
git clone https://github.com/9fans/plan9port /usr/local/plan9
```

(`/usr/local/plan9` is the "usual" directory for plan9port, but it can go
elsewhere.)

On macOS, Xcode needs to be installed (it can be found in the Mac App Store).
On Linux and \*BSD systems (but not macOS), plan9port uses X11; on some
distributions, the X11 header files are split into separate packages that need
to be installed separately.

```sh
# Debian
sudo apt-get install libx11-dev libxext-dev libxt-dev
# Ubuntu
sudo apt-get install xorg-dev
# On FreeBSD, OpenBSD, and Arch Linux, installing Xorg seems to install the
# necessary headers.  Other distributions may vary.
```

Build plan9port:

```sh
cd /usr/local/plan9
./INSTALL
```

Define `$PLAN9` and update `$PATH` in the initialization file for your shell
of choice, e.g.:

```sh
echo 'export PLAN9=/usr/local/plan9' >> ~/.zshrc
echo 'export PATH=$PATH:$PLAN9/bin' >> ~/.zshrc
```

## Patching Acme (optional)

Optionally, apply the Acme patches from this repository.  Currently, there are
two independent patches; you can apply either or both.  If applying both, they
can be applied in either order (they don't modify the same files).

- [acme-dark-theme.patch](acme-dark-theme.patch) changes the Acme color theme.
- [acme-tab-expand.patch](acme-tab-expand.patch) (__experimental__) adds
  support for expanding tabs to spaces (for further details, refer to the text
  at the top of the patch file).

```sh
# Enter the plan9port directory
cd /usr/local/plan9

# Create a branch (helps to have a branch when maintaining out-of-tree patches)
git switch -c ixtenu-acme

# Apply the patches.  If the Acme source files have been modified by the
# upstream plan9port since the patches were generated, Git will attempt to
# merge the changes, but if that fails you might have to resolve the merge
# conflicts by hand.
git am ~/acmerc/acme-dark-theme.patch
git am ~/acmerc/acme-tab-expand.patch

# Rebuild Acme
cd src/cmd/acme
mk install
```

## Installing plan9port on Windows

Plan 9 from User Space can be installed within the Windows Subsystem for Linux
(WSL).  I have only tried this on WSL 2 (which runs a virtualized Linux kernel),
not the older WSL 1 (which merely emulates Linux).

[Install WSL](https://docs.microsoft.com/en-us/windows/wsl/install) if you have
not already done so.  I have only used Ubuntu (the default Linux distribution
for WSL) but other supported distros (e.g., openSUSE or Debian) will probably
work also.

### X11 in WSL

WSLg (Windows Subsystem for Linux GUI) has support for X11 or Wayland GUI
applications.  WSLg was released as part of Windows 11 and was also available
in Windows 10 insider builds.  If you have WSLg, skip this section.  I only
have access to Windows 10 (and I'm not using insider builds), so I have not
tried to use plan9port applications with WSLg, but I presume it would "just
work".

It is possible to run X11 applications (like plan9port Acme) with a pre-WSLg
version of WSL, but this requires manual setup:

- Download and install [VcXsrv](https://sourceforge.net/projects/vcxsrv/),
  which is a version of the Xorg server that has been ported to Windows.  The
  installation defaults are fine.
- An "XLaunch" item will have been added to the Start Menu.  Open it.  Change
  two of the default settings:
  - On the first screen, the "Display number" must be `0`.
  - On the third screen, "Disable access control" must be selected.
  - See [here](https://github.com/microsoft/WSL/issues/4106#issuecomment-502920377)
    for screenshots of launching VcXsrv with these settings.
- When VcXsrv is running, there will be an X logo icon in the system tray.
  To close VcXsrv, right click on its icon and select "Exit...".

Open WSL.  Install Xorg and the X11 development headers.  For example, on
Ubuntu:

```sh
sudo apt install xorg xorg-dev
```

Test that you can launch an X11 application:

```sh
export DISPLAY=$(/sbin/ip route | awk '/default/ { print $3 }'):0
xcalc &
```

Add the `export DISPLAY` line to your shell's initialization file (e.g.,
`~/.bashrc` or `~/.zshrc`).  For example:

```sh
# If running in WSL...
if [ -d /mnt/c/Windows ]; then
    # Set DISPLAY for VcXsrv
    export DISPLAY=$(/sbin/ip route | awk '/default/ { print $3 }'):0
fi
```

That's it.  Adapted from:
[VcXsrv & Win10 "Alternative Setup"](https://sourceforge.net/p/vcxsrv/wiki/VcXsrv%20%26%20Win10/).

### Install plan9port in WSL

Once WSL 2 is installed, and X11 is working (either via WSLg or, as detailed
above, via a third-party X server), plan9port can be installed as normal.
See the [Install Plan 9 from User Space](#install-plan-9-from-user-space)
section above.

## Running Acme

While Acme can be started by invoking the `acme` executable directly,
typically it is desirable to define several environment variables and to pass
in arguments to control the fonts.  For this reason, Acme is usually opened via
a wrapper script.  The one in this repository is [bin/9a](bin/9a).

```sh
# Create shortcut
git clone https://github.com/ixtenu/acmerc ~/acmerc
ln -s ~/acmerc/bin/9a ~/bin/9a
# Run Acme (asynchronous)
9a
```

## Helper Scripts

Acme is intended to be extended via the toolbox of utility programs found on a
Unix (or Plan 9) system.  Often it is handy to create wrapper scripts that build
upon Unix programs such as `sed(1)` or `fmt(1)` to perform common functions.
Several of the scripts in [ixtenu/script](https://github.com/ixtenu/script) are
useful within Acme:

```sh
git clone https://github.com/ixtenu/script ~/script
script/install.sh
```

## Tools

For notes on tools which complement Acme (with a focus on software
development), see [tools.md](tools.md).
