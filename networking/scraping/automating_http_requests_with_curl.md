---
title: Automating HTTP requests with curl
tags: 
- networking
- scraping
---

In firefox there is a useful feature to copy the request made with the browser asa curl command. To do this, fill out a form/input field you want to submit on the website, open a network tool (CTRL+SHIFT+E) and press the button to submit.
The POST request will be generated and shown in the network tab, if you have trouble finding it, try ordering by the type of request (Method).
After that you can click on it with the right click and select "Copy Value->Copy as cURL" and you will get the whole curl command to make that request copied in your clipboard.

After you have the whole command, you can find the part that you possible want to change, for example a single input field. You can replace it with a BASH variable and place the whole command inside a for loop. For example:

for i in $(seq -w 1 10); do curl "https://example.org/?id="$i; done

You can use this for GET requests as well, but those you can also just copy the url for, instead of using the network tool.

Great thing about this is that you can also easily run the whole thing behind tor. Tor Browser is based on firefox so the network tool works exactly the same.
For the curl commands, you just need to prepend the "torsocks" in front of it, it comes with the tor package on Debain systems. For example:

for i in $(seq -w 1 10); do torsocks curl "https://example.org/?id="$i; done

It can be used for scraping, by redirectin the output, just dont forget to either use append redirection (>>) or a differently named file for each request, so you dont overwrite your previous responses.
You can also use it to create a lot of enteries in someone's database, perhaps to make some more useful data harder to find in the database by making similiar useless data or to simply fill up someones disk and make it run out of free space for new data.
