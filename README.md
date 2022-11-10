# bppaper.cls: A LaTex template for academic papers.

This template is based on the ```article``` class. I redefine the title page, the page layout and few other aspects. I also include some new options, listed below. They work as any other option:

```LaTex
\documentclass[sans,blue,narrow]{bppaper}
```

You can find an example here: [.tex file](https://github.com/borjapetit/tex_template_paper/blob/main/bppaper_example.tex) and [.pdf file](https://github.com/borjapetit/tex_template_paper/blob/main/bppaper_example.pdf).

**Note**: The user can still use any option compatible with the ```article``` class such as font size, etc.

## Options


Font typefaces:

- Helvetica (option: ```helvetica```)
- Sans-serif (option: ```sans```)
- Palatino (option: ```palatino```)
- Serif Pro (option: ```serif```).

Other options
- Option ```color```: if this option is included, headings and captions will appear in blue and links/references in dark green. The user can also define his/her own colors by writing the following commands in the preamble:
    ```LaTex
    \definecolor{main}{RGB}{000,000,000}        % Headings and other elements
    \definecolor{colorref}{RGB}{000,000,220}    % Links/references
    ```

- Option ```tikz```: the document loads the packages required to use the tikz environments. It automatically loads the libraries ```arrows```, ```positioning```, ```patterns```, ``decorations.pathreplacing`` and ```decorations.pathmorphing```.
- Option ```narrow```: it increases the margin size from 2cm (default) to 3cm.

## Title page

This template includes few new aspects to the default title page. In particular:

- **Abstract**: the user can include an abstract using ```\abstract{ ... }``` in the preamble.
- **JEL codes**: the user can specify the JEL codes of the paper using ```\jel{ ... }``` in the preamble. This will show up below the abstract.
- **Keywords**: the user can include some keywords to the title page using ```\keywords{ ... }``` in the preamble. This will show up below the abstract and the JEL codes (if defined).
- **Acknowledgements**: the user can include a footnote in the title page with acknowledgements and other comments using ```\thanks{ ... }``` in the preamble.

A "complete" preamble would be:

```Latex
\title{Title of the project}
\author{Author's name 1\\Institution 1 \and Author's name 2\\Institution 2}
\date{\today}
\abstract{A summary of the paper}
\jel{jel1, jel2, jel3}
\keywords{keyword1, keyword2, keyword3}
\thanks{I would like to thank....}
```

## New commands

- ```\hs```: equivalent to ```\hspace{0.1cm}```

- ```\vs```: equivalent to ```\vspace{0.1cm}```

- ```\llave{a}{b}```: it draws a brace under ```a``` and displays ```b```. Used for mathematical expressions. Example

    ```latex
    \begin{equation}
        \llave{ x = \dfrac{-b \pm \sqrt{b^2 - 4ac}}{2a} }{ Solution }
    \end{equation}
    ```

- ```\uline{...}```: underline some text using the ```ulem``` package.

## Default packages

In order to implement the modifications to the ```article``` class, this template automatically loads the following packages:

- ```inputenc```: packages to _tell_ LaTex what encoding is used. It loads ``utf8``.
- ```geometry```: define the size of document.
- ```enumitem```: for formatting ```itemize``` and ```enumerate``` environments.
- ```hyperref```: for links and within-doc citations.
- ```color```: define new colors. It loads the options ```usenames``` and ```dvipsnames```.
- ```titlesec```: customize section titles
- ```scrextend```: used to redefine the layout of footnotes.
- ```caption```: to customize figure/table captions.
- ```footmisc```: force footnotes to be located at the bottom. It loads the option ```bottom```.
- ```amssymb```, ```amsmath```, and ```amsthm```: for math expressions, symbols and theorems.
- ```booktabs```: to have nice separation lines for tables.
- ```setspace```: to change the line spacing within the document.

Other packages that are typically used are also loaded:

- ```natbib```: to manage .bib references. It loads the option ```authoryear```.
- ```multirow```: to merge multiple rows/columns in tables.
- ```graphicx```: to include figures.
- ```subcaption```: to include subfigures.
- ```ulem```: nicer underline enviroment.
- ```stackengine```: to to stack/shift elements.


