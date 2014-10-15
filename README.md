Automatically update your readinglist
===============

readinglist.pl is a simple perl script aiming to help you automatically extract titles and authors from a BibText file, generate a html page and upload it to a server. 

In the html, a link is generated automatically which allows you to search the title in Google Schoalr by simply clicking on it. 

Steps to use it:

(1) Instlal Perl and requried packages: Net::SCP and Net::SCP::Expect;

(2) Modify the readinglist.pl to change personal data into yours;

(3) Modify the bib.bib to add some papers you have just read;

(4) run: perl readinglist.pl bib.bib.

Contact: chengxuntao@gmail.com
