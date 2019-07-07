
Original from: https://meseta.itch.io/gm-chromium

Yoyo Marketplace: https://marketplace.yoyogames.com/assets/6887/chromium-browser

Windows-only.

Basic usage
Create event:

In a create event, a buffer must be created that is 4 times the width * height. This acts as a pixel buffer for the rendered webpages

buff = buffer_create(width*height*4, buffer_fixed, 1);
chromium_create(width, height, room_speed, buffer_get_address(buff));
chromium_set_url("https://meseta.itch.io/gm-chromium");
The Chromium instance can now be created, passing the buffer address to it, and a URL set.  Only one Chromium instance at a time is supported.

The URL can point to local files in the game's directory using file URI such as file:///local_file.html

Step event:

In a step event, the chromium_step() function must be called to process the page (future versions may remove this in favour of multi-threading).

chromium_step();
Draw event:

In the draw event, the buffer can be sent to the surface (which was previously created).  The shd_bgr_flip shader must be used for correct color display.

buffer_set_surface(buff, surf, 0, 0, 0);
shader_set(shd_bgr_flip);
draw_surface(surf,x,y);
shader_reset()
Cleanup event:

Chromium must be cleaned up or the game may fail to exit cleanly

chromium_cleanup();
Advanced Usage
chromium_create(width, height, fps, buffptr)

Creates the chromium instance.  Provide the width, height, and FPS (i.e. 30 or 60), and the pointer to the pixel buffer.  Only run once.

chromium_create_test(width, height, fps, buffptr) [v1.1]

The same as above, but used for when the game is running inside the IDE. This is lower-performance, but works around the issue where Open File dialogs show up when trying to run the game from within the IDE. This should not be used when exporting to a zip or installer.

chromium_step()

Must be run every game step.  Responsible for allowing the browser to process.

Returns 1 to indicate that the buffer was updated, or 0 to indicate that there was no change.  The return value can be used to determine whether to update the surface.

chromium_cleanup()

Must be run before game exits.  Cleanly shuts down chromium.

chromium_setup_bgtransparent() [v1.3]

Must be run before chromium_create, this will turn on transparent rendering, which is now off by default in v1.3.

chromium_set_url(url)

Sets the URL of the browser.  Can be a local file by using file:/// URI format

chromium_set_string(str, url) [v1.1]

Sets the content of the page.  For example: send HTML directly to the browser.  The url argument is the dummy URL to send the HTML to, this is usually about:blank.  Note: transparent rendering is on.

chromium_get_url()

Returns the current URL of the browser

chromium_execute(js)

Executes arbitrary Javascript on the currently loaded page.

chromium_stop()

Stop loading the current page.

chromium_reload()

Reload the current page

chromium_back()

Navigate back

chromium_forward()

Navigate forward

chromium_resize(width, height)

Resize the browser.  Note: the browser takes one step to resize, do not shrink the buffer too soon or this will cause a buffer overflow.

chromium_get_cursor()

Returns the cursor type (i.e. pointer, hand, i-beam, etc.). See scr_chromium_convert_cursor in the included project for possible values.

chromium_get_isloaded()

Returns 1 if the page has loaded. Returns 0 if the page is loading

chromium_get_can_back()

Returns 1 if it is possible to navigate back

chromium_get_can_forward()

Returns 1 if it is possible to navigate forward

chromium_get_last_http_code()

Returns the last HTTP request code

chromium_get_debug_value(value)

Super sekkrit debug stuff I forgot to remove. Returns...whatever debug value I left in there...

chromium_event_mousemove(x, y)

Tell the browser where the mouse is at.

chromium_event_mousewheel(hscroll, vscroll)

Tell the browser to scroll horizontally and vertically

chromium_event_mousebutton(x, y, button, set)

Send a mousebutton.  button is 0 for left button, 1 for middle button, and 2 for right button.  set is 1 for mouse-down, or 0 for mouse-up.  X and Y coordinates must also be provided.

chromium_event_keyboard(key, mod, set)

Send a keyboard event.  key is the keycode, mod is modifier keys (see scr_chromium_get_modifiers script for more details. set is 1 for key-down, or 0 for key-up.

chromium_event_keychar(keychar)

Sends an ASCII character.  It is normally necessary to send both a chromium_event_keyboard and a chromium_event_keychar for each keydown keystroke.  See included demo project for implementation details.

chromium_request_source() [v1.2beta] EXPERIMENTAL FEATURE

Sends a request for the page source.  Once this is sent, GM code should poll chromium_check_source() to see if the source is available; once that function returns true, it can be collected with chromium_get_source()

chromium_check_source() [v1.2beta] EXPERIMENTAL FEATURE

Polls to check if source has been fetched. Returns 0 if not, returns 1 if the source is available to be collected using chromium_get_source()

chromium_get_source() [v1.2beta] EXPERIMENTAL FEATURE

Once chromium_check_source() has returned 1, chromium_get_source() will return the page source as a string.

chromium_check_transfer() [v1.2beta] EXPERIMENTAL FEATURE

In Javascript, run window.transfer(<string>); to transfer a string to gamemaker.   This function can be polled to determine if a transfer is available. This function will return 1 if there is a transfer waiting to be read, or 0 if there is no transfer available.

See Included Files/html/test.html for implementation details

WARNING: this feature only works with browsers created using chromium_create_test().

chromium_get_transfer() [v1.2beta] EXPERIMENTAL FEATURE

Once a transfer is made, and chromium_check_transfer() returns 1, the transfer string can be read with this function.

See Included Files/html/test.html for implementation details

WARNING: this feature only works with browsers created using chromium_create_test().

Known issues:
Cannot be run from inside Gamemaker. Please export your game as a zip to run it. (For some reason, running this from within GM causes some open dialogs to appear, and the DLL to not work).  Fixed in version 1.1!
Some videos don't play. This is caused by a lack of H.264 support
Scrolling sometimes targets the wrong frame
Chromium appears to have a persistent paint cache, which may get in the way of transparent draws.  Switched off by default in version 1.3!
EXPERIMENTAL FEATURES are experimental.
Windows-only
Change log:
Version 1.3 (2018-06-13)

Transparent rendering is now off by default. This can be turned back on by running chromium_setup_bgtransparent() function before anything else.
Version 1.2beta (2018-05-16)

Added chromium_request_source(), chromium_check_source(), and chromium_get_source() to view page source
Added EXPERIMENTAL FEATURES: chromium_check_transfer() and chromium_get_transfer() to return values from Javascript to GM.
Version 1.1 (2018-05-13)

Added workaround for when game runs in the IDE (see chromium_create_test())
Added chromium_set_string() for loading HTML directly without having to save to file.
Fixed empty URL bug in demo project
Added buffer background reset in demo project
Added scr_demo_check_if_ide() to demo project