### Flag walkthrough
At the bottom of every page, there's a footer with 3 links, redirecting to 42's socials on Instagram, Twitter and Facebook.
![alt text](image.png)

Inspecting the link allows us to find out that the links are redirections from the current website: the urls are coded as such : [ip]/?page=redirect&site=instagram

Furthermore, the Instagram page is a blank profile and not the official one, but it is called 42born2code, just like the Facebook and Twitter pages (which are the official ones). "42born2code" isn't written anywhere in the links, leading us to conclude that it is hardcoded server-side and the correct website are simply retrived from the argument.

Modifying any of these arguments (e.g. replacing Instagram with Google) gets us the flag.

### Vulnerability explanation
Open redirections mean that it possible to construct a redirection URL using a given website, and make it redirect to any other website, which could be a malicious one. The link can then be used and sent to users to deceive them into trusting it and clicking, not knowing that because of the arguments passed and the main, trusted site allowing it, they will be redirected to a malicious page.

### Patch
This vulnerability is possible when there isn't a whitelist. If there is a whitelist, replacing the redirection parameters with anything simply won't work because the input will be parsed and verified according to the whitelist ; therefore the link won't work and can't be used to trick random users into clicking it (since it won't redirect them upon click).