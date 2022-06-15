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

WSLg (Windows Subsystem for Linux GUI) has support for X11 or Wayland GUI
applications.  WSLg was released as part of Windows 11 and was also available
in Windows 10 insider builds.  If you have WSLg, skip this section.  I only
have access to Windows 10 (and I'm not using insider builds), so I have not
tried to use plan9port applications with WSLg, but I presume it would "just
work".

It is possible to run X11 applications (like plan9port Acme) with a pre-WSLg
version of WSL, but this requires manual setup:

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

Once WSL 2 is installed, and X11 is working (either via WSLg or, as detailed
above, via a third-party X server), plan9port can be installed as it would be
on Linux.  See [setup.md](setup.md) for details.
