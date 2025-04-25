# Answers to exercises

Exercise 1 involve working through the COMPLECS "Using Regular
Expressions with Linux Tools" training. Exercise 2 is to apply regexes
to your own work. Answers to other problems are given below.

(3) Write a grep one-liner that will match phone numbers of the forms

(xxx) xxx-xxxx  
xxx-xxx-xxxx

You can start by handling each of the two formats separately and
ignoring additional characters that may be adjacent to the number
(e.g., "(555) 555-1234x" or "x555-555-1234"), then combine into a
single regex using alternation and proper handling of word boundaries.

(4) Write a grep one-liner that will find amino acid sequences of the
following form ('+' signs indicate concateation and are not part of
string). Optionally use -o option to output just the match. In case
you're wondering, this is a part of the pattern that can be used to
identify sequences that code for a portion of an antibody.

C + 8-17 upper case letters + W + 38-47 upper case letters + one letter from {ACFILMV}

(5) Modify the previous one-liner to limit to valid amino acids (upper case letters minus {BJOUXZ})

C + 8-17 standard amino acids + W + 38-47 standard amino acids + one letter from {ACFILMV}

--- More challenging exercises ---

(6) Write a grep one-liner that identifies strings over the alphabet
{a,b} that contain bba as a substring starting in an even-numbered
position. You can test your solution on the file ab.txt

We're using the usual convention in computer science that counting
starts at zero. In the strings bba, aabba, and aaaabba, the substring
bba starts in positions 0, 2 and 4 respectively and satisfies our
condition.

`
grep -E '^([ab][ab])*bba[ab]*$' ab.txt
`

(7) Write a grep one-liner that identifies strings over the alphabet
{a,b} in which there is no occurrence of the substring aa. You can
test your solution on the file ab.txt

Note that there are two ways to do this. The easy way is to use the
grep -v option to perform an inverted match. The hard way is to write
the full regex. We suggest trying both.

```
grep -vE 'aa'  ab.txt
grep -E '^a?(b|ba)*$' ab.txt
```

(8) Write a sed expression that replaces all occurrences of "the" with
"a" or "an" using the usual rules of English grammar: "the" when the
following word starts with a consonant and "an" when the following
word starts with a vowel. Be sure to preserve capitalization and
handle word boundaries correctly. Note that this exercise requires
that you already have a reasonable working knpowledge of sed.

You can test your solution using the file "the.txt"

Hints: Use \b to indicate word boundaries, \(...\) to capture match,
and \1 to use match.

To make this more manageable, you can put your sed command into a file
named "articles.sed", with the clauses appearing on separate lines and
terminated by semicolons. Execute using `sed -f articles.sed the.txt`

Command line solution:

```
sed 's/\bthe \([bcdfghjklmnpqrstvwxyz]\)/a \1/g; \
s/\bThe \([bcdfghjklmnpqrstvwxyz]\)/A \1/g; \
s/\bthe \([aeiou]\)/an \1/g; \
s/\bThe \([aeiou]\)/An \1/g' \
the.txt
```

Scripted solution:

s/\bthe \([bcdfghjklmnpqrstvwxyz]\)/a \1/g; # Replaces "the" followed by consonant with "a"
s/\bThe \([bcdfghjklmnpqrstvwxyz]\)/A \1/g; # Replaces "The" followed by consonant with "A"
s/\bthe \([aeiou]\)/an \1/g;                # Replaces "the" followed by a vowel with "an"
s/\bThe \([aeiou]\)/An \1/g;                # Replaces "The" followed by a vowel with "An"
