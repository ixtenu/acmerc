# Preparing WSL for plan9port

Plan 9 from User Space (a.k.a. plan9port) can be installed within the Windows
Subsystem for Linux (WSL).  I have only tried this on WSL 2 (which runs a
virtualized Linux kernel), not the older WSL 1 (which merely emulates Linux).

[Install WSL](https://docs.microsoft.com/en-us/windows/wsl/install) if you have
not already done so.  I have only used Ubuntu (the default Linux distribution
for WSL) but other supported distros (e.g., openSUSE or Debian) will probably
work also.

## X11 in WSL

While it is possible to install plan9port without X11, Acme is a GUI program
and on Linux it will need X11.

### With WSLg

WSLg (Windows Subsystem for Linux GUI) has support for X11 or Wayland GUI
applications.  WSLg was released as part of Windows 11 and was also available
in Windows 10 insider builds.  With WSLg, all you need to do is install Xorg
(and its development package, to provide the headers needed to build X11
applications).  For example, on Ubuntu:

```sh
sudo apt install xorg xorg-dev
```

Once Xorg is installed, test that you can launch an X11 application:

```sh
xcalc &
```

If that works (and it should work), then that's it, WSL setup is complete.
Proceed with plan9port installation.

### Without WSLg

Windows 10 (except for certain insider builds) does not have WSLg, and thus
out-of-the-box it only supports terminal applications.  It _is_ possible to run
X11 applications (like plan9port Acme) with a pre-WSLg version of WSL, but it
requires manual installation of a third-party Xorg server:

- Download and install [VcXsrv](https://sourceforge.net/projects/vcxsrv/),
  which is a version of the Xorg server that has been ported to Windows.
  The installation defaults are fine.
- An "XLaunch" item will have been added to the Start Menu.  Open it.  Change
  two of the default settings:
  - On the first screen, the "Display number" must be `0`.
  - On the third screen, "Disable access control" must be selected.
  - See [here][vcxlaunch] for screenshots of launching VcXsrv with these
    settings.
- When VcXsrv is running, there will be an X logo icon in the system tray.
  To close VcXsrv, right click on its icon and select "Exit...".

[vcxlaunch]: https://github.com/microsoft/WSL/issues/4106#issuecomment-502920377

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

That's it.  Adapted from: [VcXsrv & Win10 "Alternative Setup"][vcxw10].

[vcxw10]: https://sourceforge.net/p/vcxsrv/wiki/VcXsrv%20%26%20Win10/

## Install plan9port in WSL

Once WSL 2 is installed, and X11 is working (either via WSLg or via a
third-party X server, as detailed above), plan9port can be installed as it
would be on Linux.  See [setup.md](setup.md) for details.
