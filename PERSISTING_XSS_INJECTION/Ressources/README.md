### Flag walkthrough
From the homepage, there's a "LEAVE A FEEDBACK" button, that leads us to the [ip]/?page=feedback page.
There's an input field to leave a comment and a submit button, a comment is already up on the page. It is possible to send a comment and see it uploaded on the page, even after refresh.

![alt text](image.png)

Sending any comment with an html tag (such as <h1> or <img>) removes the tags, leading us to realise that the tags might be interpreted as actual html code.

All it takes is sending a comment with the word "script" in it to get the flag.

### Vulnerability explanation
This is simply a persisting XSS injection. The input sent in the comment is stored in the databse, and retrieved everytime anyone visits the page, and returned as such and displayed in the DOM. But if the text contains code, it will then be interpreted client-side. This could allow us to send many things : from a simple harmless image to a form that could send data to an external destination. The code will be interpreted and displayed to any user who visits the page even though it was never intended nor coded by the owners.

### Patch
User input should be parsed before being stored in the database, for example by making sure it doesn't contain any tags that will allow it to be interpreted as code. There are libraries that allow you to "sanitize" the received input, or strip it from potential tags.