### Flag walkthrough
From the sign in page, we are tempted to try and brute force authentification. This requires :
- a list of the most commonly used passwords and usernames (can be easily obtained for the Seclists github page)
- either a lot of patience, or a brute force tool such as Hydra

Brute force is achieved and the flag is obtained by using the password "shadow" with any user (even an empty imput).

### Patch
To avoid password brute forcing, there should be a policy that only allows complex passwords (with caps, numbers, special characters etc). This makes it harder to "guess" the password from a list of basic words.
Besides, the number of attemps can also be limited (for example, to 5 tries per account, or per IP) to prevent brute forcing scripts to try an unlimited amount of passwords.