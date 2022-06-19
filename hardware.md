# Acme Hardware Considerations

## Mouse

Acme was designed for a three-button mouse.  Any three-button mouse can be used;
however, some are better than others.  In Acme jargon, the left button is
button-1, the middle button is button-2, and the right button is button-3.  On
most mice, button-2 is activated by clicking on the scroll wheel.  Many mice
have tiny scroll wheels which are not as easy to click as the other two buttons;
mice with wider scroll wheels are better.  The ideal mouse for lengthy Acme
sessions has a dedicated button-2, just like the other two buttons and situated
between them.  Unfortunately,[^3but] such mice are specialty items; many of the
available models are 1990s vintage and have no scroll wheel (or substitute),
which makes them quite unappealing.  However, there are several good options.
The 9fans thread from 2022, ["acme and sam - mouse suggestions?"][asm], has
numerous suggestions, some of which are discussed below.

[^3but]: The rarity of three-button mice with a dedicated button-2 _and_ a
scroll wheel is unfortunate for everyone, not just Acme users.  Such mice are
far more comfortable, especially when button-2 is being used frequently, as it
is with tabbed web browsing or on Unix(-like) systems for pasting the primary
selection.  Most people have never had such mice and don't know what they are
missing.

[asm]: https://9fans.topicbox.com/groups/9fans/T49f3cceea70d2b61

### Laptop touchpads

Acme requires precise mouse movements and the ability to use multiple mouse
buttons at the same time.  This is difficult to achieve with typical laptop
touchpads.  As such, an external mouse is recommended; however, that is not
always practical, such as when using a laptop on your lap, without a surface for
an external mouse.  In such cases, Acme's support for "simulated buttons" may be
easier to use than the touchpad: holding down Ctrl/Alt (Unix) or Command/Option
(macOS) will cause button-1 to simulate button-2 or button-3, respectively.  See
[acme(1)](http://man.cat-v.org/plan_9/1/acme) for details.

Many ThinkPad models have three buttons above the touchpad, perfect for Acme.

On macOS only, the standard macOS keyboard shortcuts for copy, paste, cut,
undo, and redo are implemented, which may be easier to use than the mouse
chording equivalents on the MacBook touchpad.

### ScrollPoint

A popular mouse among Acme users, used by Acme author Rob Pike himself, is the
"ScrollPoint III Optical Mouse", formerly manufactured by Lenovo and IBM.  While
the ScrollPoint III was discontinued long ago, used and refurbished models can
be found on eBay and sometimes Newegg.  The ScrollPoint series [was not a
success][ltt] in the general market, but the ScrollPoint III is one of the few
mass-produced mice that had three real buttons and a scrolling option.  Instead
of a scroll wheel, the ScrollPoint III has, beneath button-2, a scrolling stick
(a glowing blue nub) which is pushed in the direction that one wants to scroll.
Notably, it supports horizontal scrolling in addition to vertical scrolling.

[ltt]: https://linustechtips.com/blogs/entry/2091-scrollpoint-ibms-attempt-to-reinvent-the-wheel-literally/

Unfortunately, software support for the scrolling stick is spotty.
Without a driver, horizontal scrolling does not work, and—far more
importantly—vertical scrolling is broken on some systems:

- On Linux and \*BSD, vertical scroll speed is so absurdly fast in most
  applications that the scrolling stick is useless except for jumping to
  the top or bottom of the document.  This was supposed to be [fixed][li] in
  libinput 1.11, but it's broken for me with libinput 1.20 and creating a udev
  rule and/or evdev configuration (as [some][ld] [suggest][il]) does not fix
  it.
- On Windows, vertical scroll speed is much too fast but it can be used with
  care.  Lenovo provided drivers for Windows XP and Windows 7 which I used at
  the time on those versions and which fixed the scroll speed.  Unfortunately,
  the Windows 7 driver does not seem to work with Windows 10.
- On macOS, vertical scroll speed seems to be reasonable out-of-the-box.

[ld]: https://github.com/pdewacht/hid-scrollpoint/
[li]: https://bugs.freedesktop.org/show_bug.cgi?id=106036
[il]: https://wildstar84.wordpress.com/2015/06/05/ibmlenovo-scrollpoint-mouse-with-smooth-horizontal-scrolling-in-linux/

When the scrolling stick is working, the ScrollPoint III is a nice mouse for any
use, not just within Acme.  Not everyone likes the scrolling stick, but I came
to prefer it to the scroll wheel.  When the scrolling stick is broken, the
ScrollPoint III is inferior to a normal mouse in every application except Acme,
since it is then effectively a three-button mouse without a scroll wheel, like
many models made in the 1990s.  Since the scrolling stick is now broken
everywhere except macOS, which isn't my daily driver, it is an unsatisfactory
solution.

### VerticalMouse

Russ Cox (creator of plan9port) and others use the [Evoluent
VerticalMouse][evm].  As the name implies, it has a vertical orientation: on
the right (for the right-handed model), it has three buttons and a scroll wheel.
I have not yet tried this myself; it is expensive and the vertical orientation
is not what I am used to.

[evm]: https://evoluent.com/

### Contour

Contour (a company specializing in ergonomic computing peripherals) has made
two mice models with three real buttons:

- The [Contour Mouse][cm] has three buttons with the scroll wheel moved to the
  side, to be operated by the thumb.  Has a 17-degree slope, not so different
  from a normal mouse.  Discontinued in 2021 but obtainable.
- The [Unimouse][uni] has three buttons with a scroll wheel between button-1
  and button-2.  Departs further from normal mice than the Contour Mouse,
  with a 35-degree (minimum) slope.

[cm]: https://www.contourdesign.com/product/contour-mouse/
[uni]: https://www.contourdesign.com/product/unimouse/

Both models are popular among Acme users, but I have no personal experience
with them.

### CadMouse

Apparently, CAD applications (much like Acme) use button-2 so much that there is
a market for mice with dedicated button-2s.  The [CadMouse][cad] (all models)
has a "dedicated middle button" as a prominent feature.  All models have a
scroll wheel between button-1 and button-2.  These mice are relatively expensive;
currently, the models cost between $80 and $120.

[cad]: https://3dconnexion.com/us/cadmouse/

Some online reviews report that the CadMouse is incompatible with macOS Big Sur
(released in 2021) due to a driver issue.

### Beatus

The "Beatus" is a mouse made by [Dongguan Xuanshuo Electronics][dxe], a company
based in southern China.  It is a normal-shaped mouse with three dedicated
buttons of approximately equal size.  Although not sold in Western outlets, it
can be obtained from Japanese resellers; a search for "Beatus mouse" on eBay
finds several.  There are [eight models][dxep], all of which have a dedicated
button-2, but vary in being: optical or mechanical, wired or wireless, and with
three scroll wheel configurations: no scroll wheel, scroll wheel on the left
(thumb operated), and scroll wheel between button-1 and button-2.  All the
Beatus mice currently available on eBay are optical and wired; and they either
have no scroll wheel or the thumb-operated scroll wheel on the left.  I ordered
the latter: it costs from $40 to $65 (including shipping to North America),
depending on the seller.

[dxe]: http://www.hao1885.com/
[dxep]: http://www.hao1885.com/products.asp

I have been using the Beatus as my primary mouse and my early impressions are
generally favorable:

- All three buttons are comfortable to click.  The full-size button-2 is nicer
  than the compact button-2 on the ScrollPoint III.
- It took a couple hours to get used to the thumb-operated scroll wheel, but
  afterward it feels just as natural as middle-finger operated scroll wheels.
- The scroll wheel is silent: no audible clicking sound when scrolling.
- It works on every OS (Linux, FreeBSD, macOS, Windows) and with KVM switches.
  No special driver or tweaking is required.
- The LED on the bottom is green rather than the usual red.  An n=1 datapoint,
  but it did not work well on a desk surface that other mice had no trouble
  with; using a mousepad fixed the issue.

As of this writing, I've only had the mouse for a week.  There are some
[negative customer reviews on Japanese Amazon][amzb] (which can be machine
translated into English) complaining of poor durability.

[amzb]: https://www.amazon.co.jp/-/en/Beatus-Button-Perfect-Buttons-Scroll/dp/B07CZ1B7H3

The scroll wheel on the left of the mouse is designed for right-handed mouse
use.  There is no model which has the scroll wheel on the right for left-handed
mouse use.

## Keyboard

Because Acme is a mouse-heavy text editor, it is essential to reduce the
distance between the mouse and the mousing hand's home row position on the
keyboard.  For those who use the mouse with their left hand, any normal keyboard
will work.  For those who use the mouse with their right hand, this means using
a keyboard without a numeric keypad (if you occasionally need the NumPad, e.g.,
for spreadsheets, you can buy a USB NumPad and put it off to the side).

Here is the approximate travel distance that I measured when moving my right
hand from the right hand home row to the mouse on the right side with various
keyboards that I have:

- Unicomp Model M (104-key full-sized and unusually bulky): 13 inches
- CODE Keyboard (104-key full-sized): 11 inches
- CODE Keyboard (87-key compact): 7 inches
- Keychron K2 v2 (84-key compact): 6 inches
- System76 Launch Keyboard (84-key compact): 6 inches
- Happy Hacking Professional 2nd Generation (60-key subcompact): 5 inches

The difference between 11 inches and 6 inches is tangible.  Keyboards which
eliminate the Home, End, PgUp, PgDn, and Arrow keys (located on the right side
of the keyboard) can reduce the distance a little further, but personally I use
those keys often enough that prefer to retain them even if it means an extra
inch of travel distance.

## Monitor

Acme's flexible windowing system is well-suited to large high-resolution
computer monitors.  I do not have experience with such monitors (all my monitors
are 1920x1080 and most of my computers are too old to output anything better),
but [John Floren][jft] provides [this 3838x2139 pixel screenshot][apng] showing
what Acme is capable of when ample screen real estate is available.

[jft]: https://jfloren.net/tools.html
[apng]: https://jfloren.net/content/acme.png
