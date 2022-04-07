---
title: "festival"
tags: [ "Documentation", "Sound" ]
---
# Basics

Add your user to the audio group, and install `festival-english`.

> echo "(Parameter.set 'Audio_Method 'Audio_Command)" >> /usr/share/festival/voices.scm

> echo "(Parameter.set 'Audio_Command "aplay -q -c 1 -t raw -f s16 -r $SR $FILE")" /usr/share/festival/voices.scm

# Set Default Voice

Edit ~/.festivalrc with 

`(set! voice_default voice_cmu_us_slt_arctic_hts)`

Or change the order in `/usr/share/festival/voices.scm`

