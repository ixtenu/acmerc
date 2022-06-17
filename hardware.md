# Acme Hardware Considerations

## Mouse

Acme was designed for a three-button mouse.  Any three-button mouse can be
used; however, some are better than others.  In Acme jargon, the left button
is button-1, the middle button is button-2, and the right button is button-3.
On most mice, button-2 is activated by clicking on the scrollwheel.  Many mice
have tiny scrollwheels which are not as easy to click as the other two buttons;
mice with wider scrollwheels are better.  The ideal mouse for lengthy Acme
sessions has a dedicated button for button-2, just like the other two buttons
and situated between them.  Unfortunately, such mice are specialty items;
many of the available models are 1990s vintage and have no scrollwheel
(or substitute), which makes them quite unappealing.  However, there are
several good options.  The 9fans thread from 2022, ["acme and sam - mouse
suggestions?"][asm], has numerous suggestions, some of which are discussed
below.

[asm]: https://9fans.topicbox.com/groups/9fans/T49f3cceea70d2b61

### Laptop touchpads

Laptop touchpads are awkward to use with Acme, since it requires precise mouse
movements and the ability to use multiple mouse buttons at the same time.
As such, an external mouse is recommended; however, that is not always
practical, such as when using a laptop on your lap, without a surface for an
external mouse.  In such cases, Acme's support for "simulated buttons" may be
easier to use than the touchpad: holding down Ctrl/Alt (Unix) or Command/Option
(macOS) will cause button-1 to simulate button-2 or button-3, respectively.
See [acme(1)](http://man.cat-v.org/plan_9/1/acme) for details.

Many ThinkPad models have three buttons above the touchpad, perfect for Acme.

On macOS only, the standard macOS keyboard shortcuts for copy, paste, cut,
undo, and redo are implemented, which may be easier to use than the mouse
chording equivalents on the MacBook touchpad.

### ScrollPoint

A popular mouse among Acme users, used by Rob Pike himself, is the "ScrollPoint
III Optical Mouse", formerly manufactured by Lenovo and IBM.  While the
ScrollPoint III was discontinued long ago, used and refurbished models can
be found on eBay and sometimes Newegg.  The ScrollPoint series [was not a
success][ltt] in the general market, but the ScrollPoint III is one of the few
mass-produced mice that had three real buttons and a scrolling option.  Instead
of a scrollwheel, the ScrollPoint III has, beneath button-2, a scrolling stick
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

When the scrolling stick is working, the ScrollPoint III is a nice mouse for
any use, not just within Acme.  Not everyone likes the scrolling stick, but I
came to prefer it to the scrollwheel.  When the scrolling stick is broken,
the ScrollPoint III is inferior to a normal mouse in every application
except Acme, since it is then effectively a three-button mouse without a
scrollwheel, like many models made in the 1990s.  Since the scrolling stick
is now broken everywhere except macOS, which isn't my daily driver, when using
the ScrollPoint I typically connect another normal mouse with a scrollwheel and
switch between them, but this is an unsatisfactory solution.

### VerticalMouse

Russ Cox (creator of plan9port) and others use the [Evoluent
VerticalMouse][evm].  As the name implies, it has a vertical orientation: on
the right (for the right-handed model), it has three buttons and a scrollwheel.
I have not yet tried this myself; it is expensive and the vertical orientation
is not what I am used to.

[evm]: https://evoluent.com/

### Contour

Contour (a company specializing in ergonomic computing peripherals) has made
two mice models with three real buttons:

- The [Contour Mouse][cm] has three buttons with the scrollwheel moved to the
  side, to be operated by the thumb.  Has a 17-degree slope, not so different
  than a normal mouse.  Discontinued in 2021 but obtainable.
- The [Unimouse][uni] has three buttons with a scrollwheel between button-1
  and button-2.  Departs further from normal mice than the Contour Mouse,
  with a 35-degree (minimum) slope.

[cm]: https://www.contourdesign.com/product/contour-mouse/
[uni]: https://www.contourdesign.com/product/unimouse/

Both models are popular among Acme users, but I have no personal experience
with them.

### CadMouse

Apparently, CAD applications (much like Acme) use the middle button so much that
there is a market for mice with dedicated middle buttons.  The [CadMouse][cad]
(all models) has a "dedicated middle button" as a prominent feature.  All models
have a scrollwheel between button-1 and button-2.  These mice are relatively
expensive; currently, the models cost between $80 and $120.

[cad]: https://3dconnexion.com/us/cadmouse/

Some online reviews report that the CadMouse is incompatible with macOS Big Sur
(released in 2021) due to a driver issue.

### Beatus

The Beatus is a CAD mouse from Japan, or so it appears; everyone selling it on
eBay is based in Japan or a specialist in Japanese goods, so I assume that's
where it's from, even though I have not found its product page (presumably
it has one, in Japanese).  The Beatus is a normal-shaped mouse with three
dedicated buttons.  The Beatus mice which have scrollwheels have them on the
left side, to be operated with the thumb.  Some Beatus mice have no scrollwheel
at all, so be sure to scrutinize the product photos on eBay.  They sell for
$30 to $45 each, not including shipping (for North America, this adds another
$20 or so).  I ordered one but, as of this writing, have not received it yet.

## Keyboard

Because Acme is a mouse-heavy text editor, it is essential to reduce the
distance between the mouse and the mousing hand's home row position on the
keyboard.  For those who use the mouse with their left hand, any normal keyboard
will work.  For those who use the mouse with their right hand, this means using
a keyboard without a numeric keypad (if you occasionally need the NumPad, e.g.,
for spreadsheets, you can buy a USB NumPad and put it off to the side).

Here is the approximate travel distance that I measured when moving my right
hand from the right hand home row and the mouse on the right side with various
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
