# LaTeX class for University of Helsinki dissertations

The class corresponds to [the instructions published by Unigrafia](https://unigrafia.fi/en/services/support-services/dissertations-university-of-helsinki/).

## Usage

Copy the file *dissunihel.cls* somewhere where your TeX installation can find it, 
e.g. your current working directory.

To use the class for your thesis, add the line 
```latex
\documentclass[<options>]{dissunihel}
```
to the top of your LaTeX source.

Available standard `book` class options are `onecolumn`, `twocolumn`, `draft` and `final`.

Currently only supports A4 page size with symmetric margins which will be reduced in press.

See file *thesis.tex* for an example document.
