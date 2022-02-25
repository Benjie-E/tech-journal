# Password Cracking
## Cewl
- Crawls website and creates wordlist
- `cewl url -w 'output file'`
## Rsmangler
- Generates wordlist from list of words
- `rsmangler --file 'file' --output 'output file' -x 'maxlength' -9 'minlength' -l -s -e -i -p -a`
- All parameters enabled at start
  - -l lowercase word
  - -s swap case of word
  - -e adds ed to word
  - -i adds ing to word
  - -p permutate all words
  - -a creates acronym of all words
## Hydra
### http-get
- `hydra -l username -P passwordlist -s port -f ip http-get /urlpath/`

## Issues
- Couldn't
