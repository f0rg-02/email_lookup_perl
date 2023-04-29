# perl: email_verify.pl 
Just a perl script that connects to google smtp and checks if the email might be valid or not. This was pretty simple and you can use telnet to verify as well. I just wanted to check a list of emails. 

A good article is here: https://faun.pub/verify-email-existence-via-command-line-e5cbee779d26

To get started if you are on linux make sure cpanminus is installed. 

On Debian you can do that by doing: ```sudo apt install cpanminus```

For windows I recommend Strawberry Perl, but I am not sure about cpan since I do not run Windows really.

You just need to install the Net::SMTP module which you can by doing: ```cpanminus -i Net::SMTP```

To run the script, the syntax is: ```perl email_verify.pl <list_of_emails> <output_file>```
