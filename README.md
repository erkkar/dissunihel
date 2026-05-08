# LaTeX class for University of Helsinki dissertations

## Usage

Copy the file *dissunihel.cls* somewhere where your TeX installation can find it, 
e.g. your current working directory.

To use the class for your thesis, add the line 
```latex
\documentclass[<options>]{dissunihel}
```
to the top of your LaTeX source.

Available standard `book` class options are `onecolumn`, `twocolumn`, `oneside`, `twoside`, `draft` and `final`.

Currently only supports A4 page size which will be reduced in press.

See file *thesis.tex* for an example document.
