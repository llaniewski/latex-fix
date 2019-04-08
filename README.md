# LaTeX autofix script

A first go at a tool which would fix common latex mistakes and best-practice-guide type of things.

## Install:

```bash
apt install meld
git clone https://github.com/llaniewski/latex-fix.git autofix
```

## Usage:
```bash
autofix/autofix somefile.tex
```

If you use a separate file for acronyms (`\newacronym`) then you can provide this file as the second argument:
```bash
autofix/autofix somefile.tex glossary.tex
```


