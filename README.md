# notepad
This is a notepad implementation that uses Lua and the LÖVE2D framework. Currently, it only runs on Mac and supports doodling and writing simple texts. This is a work in progress.
## Doodling
There are three features supported in doodling: **rectangles**, **circles** and **free lines**. Press the "L" key for lines, the "R" key for rectangles and the "C" key for circles. Also, press the "F" key to ~~pay respects~~ switch between fill mode and empty mode.
- When drawing rectangles, click one time to specify the first corner, then another time to specify the second corner.
- When drawing circles, click one time to specify the center point, then another to define the radius.
- When drawing lines, just keep the mouse clicked and drag it across the screen.
## Writing
In writing, you can create strings and choose where to put them on the screen using the mousepad. When you have chosen where to put the text, click once. Also:
- Press the "W" key to switch to writing mode.
- Press lShift to make the font smaller, and rShift to make it larger.
- Press the "return" key for a new line.
- Press the "Caps Lock" key to switch between lower and upper case.
## Saving and Loading
This notepad implementation has a very simple saving and loading system. Press "command" then "S" if you want to save your notes, then write a file name. If you want to open some notes, press "command", then "O", and type in the name under whick you saved those notes.
## Navigating your Notes
The application offers an unlimited number of pages. To navigate them, use the "up" and "down" arrow keys.

