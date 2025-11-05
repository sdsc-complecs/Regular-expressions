# This file contains the examples used in the COMPLECS "Using Regular
# Expressions with Linux Tools" training. We try to keep this
# consistent with the accompanying slide deck although there may be
# occassional diffferences. Note that the options passed to grep (-E,
# -o, -P, -w) are specific to grep and are not part of the regex
# syntax.

# Literal strings
grep banana fruit.txt
grep Banana fruit.txt

# Multiple characters and ignoring case
grep -i banana fruit.txt
grep [bB]anana fruit.txt
grep [bdrw]ash ash.txt
grep [^bdrw]ash ash.txt
grep [d-h]ash ash.txt
grep [^c-r]ash ash.txt
grep [-g-l]ash ash.txt
grep [[:lower:]]oot oot.txt
grep [[:upper:]]oot oot.txt
grep [[:alpha:]]oot oot.txt
grep [[:digit:]]oot oot.txt
grep [[:alnum:]]oot oot.txt
grep [[:punct:]]oot oot.txt
grep [[:lower:]3]oot oot.txt
grep [[:punct:][:digit:]]oot oot.txt
grep b....a fruit.txt
grep .e..h fruit.txt
grep .ea. fruit.txt

# Quantifiers (using full set)
grep -E 'ab*c' abc.txt
grep -E 'ab+c' abc.txt
grep -E 'ab?c' abc.txt
grep -E 'ab{3,}c' abc.txt
grep -E 'ab{,3}c' abc.txt
grep -E 'ab{3,5}c' abc.txt

# Quantifiers (using just Kleene star and alternation)
grep -E 'abb*c' abc.txt
grep -E 'ac|abc' abc.txt
grep -E 'abbbc' abc.txt
grep -E 'abbbb*c' abc.txt
grep -E 'ac|abc|abbc|abbbc' abc.txt
grep -E 'abbbc|abbbbc|abbbbbc' abc.txt

# Demonstrating greediness (default behavior)
grep p.*r fruit.txt

# Anchors and alternation
grep pear fruit.txt
grep '^pear' fruit.txt
grep 'pear$' fruit.txt
grep -E '^pear|pear$' fruit.txt

# Word boundaries
grep -E '[0-9]{5}' zip.txt
grep -E '^[0-9]{5}[[:punct:][:space:]]|[[:punct:][:space:]][0-9]{5}[[:punct:][:space:]]|[[:punct:][:space:]][0-9]{5}$|^[0-9]{5}$' zip.txt
grep -E '\<[0-9]{5}\>' zip.txt
grep -Ew '[0-9]{5}' zip.txt

# Lazy matching
grep -E 'A.*B' lazy.txt
grep -P 'A.*?B' lazy.txt 

# Escaping
grep -E '(.*)x(.*)' spc.txt
grep -E '\(.*\)x\(.*\)' spc.txt
grep -Eo '{[0-9]+}' spc.txt
grep -Eo '\{[0-9]+\}' spc.txt

# Awk examples
awk '/^pear|pear$/ {print}' fruit.txt
awk '/ab{3,}c/ {print}' abc.txt

# Sed examples
sed -E 's/^pear|pear$/XXXX/' fruit.txt
sed 's/^pear\|pear$/XXXX/' fruit.txt

# Searching compressed files
xzgrep -E 'pear$' fruit.txt.bz2 # Compressed using bzip2
xzgrep -E 'pear$' fruit.txt.gz  # Compressed using gzip
xzgrep -E 'pear$' fruit.txt.xz  # Compressed using xz
xzgrep -E 'pear$' fruit.txt.Z   # Compressed using compress
