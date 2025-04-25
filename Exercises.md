# Regular expression exercises

This file contains some suggested exercises to help you master the
material covered in the COMPLECS "Using Regular Expressions with Linux
Tools" training.

(1) Work through all the examples from the presentation, found in the
file examples.sh, and make sure you understand what the regexes are
doing. We also suggest modifying the examples or deliberately breaking
things (e.g., omitting quotes, backslashes, grep options, etc.) to see
what happens.

(2) The best way to learn regexes is to apply them to your own
work. If you have a data processing task where a regex might help, try
developing a solution now.

(3) Write a grep one-liner that will match phone numbers of the forms

xxx-xxxx  
xxx-xxx-xxxx

You can approach this incrementally by handling each of the two
formats separately and ignoring additional characters that may be
adjacent to the number (e.g., "555-555-1234x" or "x555-555-1234"),
then combine into a single regex using alternation and proper handling
of word boundaries. Test your solution with the file phone.txt

(4) Write a grep one-liner that will find amino acid sequences of the
following form ('+' signs indicate concatenation and are not part of
string).  Optionally use -o option to output just the match. In case
you're wondering, this is a part of the pattern that can be used to
identify sequences that code for a portion of an antibody.

C + 8-17 upper case letters + W + 38-47 upper case letters + one letter from {ACFILMV}

(5) Modify the previous one-liner to limit to valid amino acids (upper
case letters minus {BJOUXZ})

C + 8-17 standard amino acids + W + 38-47 standard amino acids + one letter from {ACFILMV}

--- More challenging exercises ---

(6) Write a grep one-liner that identifies strings over the alphabet
{a,b} that contain bba as a substring starting in an even-numbered
position. You can test your solution on the file ab.txt

We're using the usual convention in computer science that counting
starts at zero. In the strings bba, aabba, and aaaabba, the substring
bba starts in positions 0, 2 and 4 respectively and satisfies our
condition.

(7) Write a grep one-liner that identifies strings over the alphabet
{a,b} in which there is no occurrence of the substring aa. You can
test your solution on the file ab.txt

Note that there are two ways to do this. The easy way is to use the
grep -v option to perform an inverted match. The hard way is to write
the full regex. We suggest trying both.

(8) Write a sed expression that replaces all occurrences of "the" with
"a" or "an" using the usual rules of English grammar: "the" when the
following word starts with a consonant and "an" when the following
word starts with a vowel. Be sure to preserve capitalization and
handle word boundaries correctly. Note that this exercise requires
that you already have a reasonable working knpowledge of sed.

You can test your solution using the file "the.txt"

Hints: Use `\b` to indicate word boundaries, `\(...\)` to capture match,
and `\1` to use match.

To make this more manageable, you can put your sed command into a file
named "articles.sed", with the clauses appearing on separate lines and
terminated by semicolons. Execute using `sed -f articles.sed the.txt`
