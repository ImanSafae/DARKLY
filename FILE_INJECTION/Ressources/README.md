### Flag walkthrough
From the homepage, there's an "UPLOAD IMAGE" button leading to a page with an input that allows us to load and send any file from our machine (including files that aren't pictures).

Sending in a .php file and changing the MIME type in the request to image/jpg will give us the flag.

### Vulnerability explanation
The form supposedly requests pictures. However, it is possible to cheat around that rule by modifying the MIME type of the file from the request, and sending any file. This allows us to send files that could contain malicious code.

### Patch
The files received need to be verified and parsed ; the extension should be verified. The user input can be easily edited and should not be trusted.