---
title: "screen"
tags: [ "Documentation", "Networking" ]
---

start session: screen

> screen -S 'name'
	Make a screen with name 'name'
> screen -r 'name'
	Reattach screen 'name'.  Names need not be complete
> screen -ls
	list screen sessions
> screen -X -S 'screen' 'command'
	Send 'command' to 'screen', e.g. 'quit', 

**Ctrl + a**
Screens have a list of commands to send

:? - keybindings
:" - list screen sessions
:A - rename window
:d - detatch
:k - kill the screen
:n - next screen
:p - previous screen
:\ - kill all screens
:| - create new pane

**Panes**
:| - create new pane
:w - list of windows, input name of window to summon
:C - clear pane
:d - detatch pane
:X - kill pane
:* - displays
:{/} - history
:i - info
:k - kill
:x - lockscreen
:L - login
:S - horizontal pane
:w - list of open windows
[n] - pick number 1-0 to pick a window


------Example----------
Start a new session with 'screen -S base' (which calls that session 'base').  Make a horizontal split with ^|, move into it with ^tab then create a new screen with ^c in that second split.  The new screen can be named with ^A as 'music' before entering cmus.  Next up, visualizations with vis in another screen.  ^S makes a horizontal split and you can switch into that with ^tab to name is 'visualizations' and start vis.  Switch back to the first screen and make another horizontal split and a screen in there with the name 'reading'.  Inside reading you type ^? to get a list of useless screen commands.  Reading can then be detatched with ^d and the horizontal split destroyed with ^X.

Those visualizations should be larger, so we enlarge them with Ctrl+: to send the command resize 50 and :resize -h 100.

Once done with reading, you can destroy it wil ^k then destroy the lot once done with ^\.  Outside the screens entirely you can ensure complete death with 'killall screen'.

----------------------


