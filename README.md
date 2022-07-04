# bppaper.cls


This template is based on the ```article``` class. I redefine the title page, the page layout and few other aspects. I also include some new options, listed below. They work as any other option:

  ```\documentclass[sans,blue,narrow]{bppaper}```

### Font typefaces
- Helvetica ( ```helvetica``` )
- Sans-serif ( ```sans``` )
- Iowa ( ```iowa``` )
- Palatino ( ```palatino``` )
- Bookman ( ```bookman``` )
- Termes ( ```termes``` )
- Adventor ( ```adventor``` )

### Colors

- ```green```: headings and other elements are in green, and links and references in blue
- ```red```: headings and other elements are in red, and links and references in green
- ```blue```: headings and other elements are in blue, and links and references in green

The user can also define his/her own colors by writing the following commands in the preamble:

  ```\definecolor{main}{RGB}{000,000,000$}``` - Headings and other elements<br>
  ```\definecolor{colorref}{RGB}{000,000,220$}``` - Links/references


### Other options

- ```tikz```: the document loads the packages required to use the tikz environments.
  - It automatically loads the libraries ```arrows```, ```positioning```, ```patterns```, ```decorations.pathreplacing``` and ```decorations.pathmorphing```.
- ```narrow```: it increases the margin size from 2cm (default) to 3cm.

### Default packages

- ```inputenc```: packages to _tell_ LaTex what encoding is used. It loads ```utf8```.
- ```geometry```: define the size of document.
- ```enumitem```: for formatting ```itemize``` and ```enumerate``` environments
- ```hyperref```: for links and within-doc citations
- ```color```: define new colors. It loads the options ```usenames``` and ```dvipsnames```
- ```titlesec```: customize section titles
- ```scrextend```: used to redefine the layout of footnotes.
- ```caption```: to customize figure/table captions
- ```subcaption```: to include subfigures.
- ```multirow```: to merge rows and columns in ```tabular``` environment.
- ```footmisc```: force footnotes to be located at the bottom. It loads the option ```bottom```.
- ```natbib```: used to manage .bib references. It loads the option ```authoryear```.
- ```amssymb,amsmath,amsthm```: for math expressions, symbols and theorems.
- ```graphicx```: to include figures.
- ```booktabs```: to have nice separation lines for tables.
- ```setspace```: to change the line spacing within the document.
