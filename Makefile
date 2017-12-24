all: README.md soup.1

README.md: soup.pl
	pod2markdown $? > $@

soup.1: soup.pl
	pod2man $? > $@
