
> yay -S signal-cli

Choose option 3 for Arch Arm - `jdk8-openjdk`.

Register your number, including the country's area code:

> signal-cli -u +381616643141 register

Or for landlines: 

> signal-cli -u +381629775298 register --voice

Then verify:

> signal-cli -u +381616643141 verify 839-382

Send:

> signal-cli -u +381616643141 send -m "message" +381616643141

Receive all messages:

> signal-cli -u +381616643141 receive

