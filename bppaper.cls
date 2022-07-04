
% Written by Borja Petit, 2021.
% Distributed under MIT license.

\ProvidesClass{bppaper}[2021 Borja Petit, Template for papers]

% Options:
% *********
%	- 10pt: use fontsize 10p
%	- 11pt: use fontsize 11pt
%	- 12pt: use fontsize 12pt
% 	- narrow: narrow margins
%	- green: color green for title, headins, etc 
%	- blue: color blue for title, headins, etc 
%	- red: color red for title, headins, etc
% 	- iowa: use iowa font
% 	- sf: use sans serif font
% 	- titlesf: use sans serif for titles, headings
% 	- helvetica: use helvetica font
% 	- tikz: upload the tikz packages


\DeclareOption{narrow}{\def\narrow{1}}

\DeclareOption{iowa}{\def\fontiowa{1}}
\DeclareOption{sans}{\def\fontsf{1}}
\DeclareOption{helvetica}{\def\fonthelvet{1}}
\DeclareOption{patalino}{\def\fontpala{1}}
\DeclareOption{bookman}{\def\fontbookman{1}}
\DeclareOption{termes}{\def\fonttermes{1}}
\DeclareOption{adventor}{\def\fontadventor{1}}

\DeclareOption{green}{\def\colorgreen{1}}
\DeclareOption{red}{\def\colorred{1}}
\DeclareOption{blue}{\def\colorblue{1}}

\DeclareOption{tikz}{\def\tikz{1}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage{geometry}					% Define the size of document
\RequirePackage{enumitem}					% For formatting itemize and enumerate
\RequirePackage{hyperref}					% For links and within-doc citations
\RequirePackage[usenames,dvipsnames]{color}	% Define new colors
\RequirePackage{titlesec}						% Customize section titles
\RequirePackage{scrextend}					% Define footnotes' layout
\RequirePackage{caption}						% Redefine figure/table captions format
\RequirePackage{subcaption}					% Subfigures
\RequirePackage{multirow}					% Srt multiple rows/columns in tables
\RequirePackage[bottom]{footmisc}				% Make footnotes be located at the bottom.
\RequirePackage[authoryear]{natbib}			% For Bib references
\RequirePackage{amssymb,amsmath,amsthm}		% Math expressions, symbols and theorems.
\RequirePackage{graphicx}					% Include figures
\RequirePackage{booktabs}					% Nice lines for tables
\RequirePackage{setspace}					% Nice lines for tables

\ifdefined\tikz
\RequirePackage{tikz}
\usetikzlibrary{arrows}
\usetikzlibrary{positioning}
\usetikzlibrary{patterns}
\usetikzlibrary{decorations.pathreplacing}
\usetikzlibrary{decorations.pathmorphing}
\else\relax\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FONT FAMILY:

% Iowa font
\ifdefined\fontiowa
	\renewcommand*\rmdefault{iwona}
\else\relax\fi

% San-serif (default) font
\ifdefined\fontsf
	\renewcommand\familydefault{\sfdefault}
	\RequirePackage{sfmath}
\else\relax\fi

% Helvetica font
\ifdefined\fonthelvet
	\RequirePackage[scaled]{helvet} 
	\renewcommand\familydefault{phv}
	\RequirePackage[helvet]{sfmath}
\else\relax\fi

% Palatino font
\ifdefined\fontpala
	\RequirePackage{palatino} 
	\renewcommand\familydefault{ppl}
	\RequirePackage[lm]{sfmath}
\else\relax\fi

% Palatino font
\ifdefined\fontbookman
	\RequirePackage{bookman} 
	\renewcommand\familydefault{pbk}
\else\relax\fi

% Termes font
\ifdefined\fonttermes
	\RequirePackage{tgtermes} 
	\renewcommand\familydefault{qtm}
\else\relax\fi

% Adventor font
\ifdefined\fontadventor
	\RequirePackage{tgadventor} 
	\renewcommand\familydefault{qag}
	\RequirePackage{sfmath}
\else\relax\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLORS:

\definecolor{main}{RGB}{000,000,000}
\definecolor{colorref}{RGB}{000,000,220} 

% Green:
\ifdefined\colorgreen	
	\definecolor{main}{RGB}{000,120,000}
	\definecolor{colorref}{RGB}{000,000,220}
\else\relax\fi

% Blue:
\ifdefined\colorblue
	\definecolor{main}{RGB}{000,000,180}
	\definecolor{colorref}{RGB}{000,110,000}
\else\relax\fi

% Red:
\ifdefined\colorred
	\definecolor{main}{RGB}{180,000,000}
	\definecolor{colorref}{RGB}{000,110,000}
\else\relax\fi

\hypersetup{colorlinks=true,linkcolor=colorref,citecolor=colorref,urlcolor=colorref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TITLES OF SECTION/SUBSECTION/ETC

% Numbering style
\def\thesection{{\arabic{section}}}
\def\thesubsection{\thesection.\arabic{subsection}}
\def\thesubsubsection{\thesubsection.\arabic{subsubsection}}

% Font style
\titleformat{\section}{\color{main}\Large\bfseries}{\thesection}{0.5em}{}
\titleformat{\subsection}{\color{main}\large\bfseries}{\thesubsection}{0.5em}{}
\titleformat{\subsubsection}{\color{main}\normalsize\bfseries}{\thesubsubsection}{0.5em}{}
\titleformat{\paragraph}[runin]{\color{main}\normalsize\bfseries}{\theparagraph}{}{}

% Spacing
\titlespacing*{\section}{0pt}{0.7cm}{0.5cm}
\titlespacing*{\subsection}{0pt}{0.7cm}{0.4cm}
\titlespacing*{\subsubsection}{0pt}{0.4cm}{0.2cm}
\titlespacing*{\paragraph}{0pt}{0.3cm}{0.2cm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAGE LAYOUT:

% Size of the document:
\geometry{top=2cm, bottom=2.5cm, right=2cm, left=2cm, footskip=1cm, footnotesep=0.4cm}
\ifdefined\narrow
	\geometry{top=3cm, bottom=3cm, right=3cm, left=3cm, footskip=1cm, footnotesep=0.4cm}
\else\relax\fi

% Line height
\renewcommand{\baselinestretch}{1.5}

% paragrpah spacing
\setlength{\parindent}{20pt}
\setlength{\parskip}{0.0cm}

% spansing between references items
\setlength{\bibsep}{5pt}

% Setting space below and above equations
\makeatletter
\g@addto@macro\normalsize{
  \setlength\abovedisplayskip{13pt}
  \setlength\belowdisplayskip{13pt}
  \setlength\abovedisplayshortskip{13pt}
  \setlength\belowdisplayshortskip{13pt}}
\makeatother

% Make the content of the page to appear in the very top
\raggedbottom

% Footnotes
\deffootnote[1.8em]{1.8em}{0.0cm}{${\thefootnotemark}.$\enskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIGURES AND FIGURES

% Captions
\captionsetup{labelfont={bf,color=main}}
\captionsetup{justification=centering}
\captionsetup{belowskip=8pt}
\captionsetup{aboveskip=5pt}

% Baseline array height
\renewcommand{\arraystretch}{1.0}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TITLE PAGE

% Defining elements of the title: abstract, keywords, thanks.
\makeatletter\renewenvironment{abstract}[1]{\def\Abstract{#1}}	\makeatother
\makeatletter\renewenvironment{thanks}[1]{\def\thankyou{#1}}    \makeatother
\makeatletter\newenvironment{jel}[1]{\def\jela{#1}}				\makeatother
\makeatletter\newenvironment{keywords}[1]{\def\keywordsa{#1}}	\makeatother

% Defining \maketitle command
\makeatletter
\def\maketitle{ \ \
\thispagestyle{empty}
\vfill
\begin{center}
	\begin{minipage}{0.8\textwidth}
	\centering
	    % Title
		\begin{spacing}{1.5}
			\LARGE{\color{main}\textbf{\@title}}
		\end{spacing}
		\vskip0.8cm\par
		% Author
		\begin{spacing}{1}
			\Large{\begin{tabular}[t]{c}
				\@author
			\end{tabular}}
		\end{spacing}
		\vskip1.5cm\par
		% Date
		{\Large\@date}		
	\end{minipage}
	\par
	% Abstract
	\ifdefined\Abstract
	    \vskip1.5cm
		\begin{minipage}{0.9\textwidth}\begin{spacing}{1.0}{\small
			\begin{center}
				\textbf{\color{main}Abstract}
			\end{center}
			\Abstract
			\ifdefined\jela
			    \par\vskip0.3cm
			    {\color{main}\textbf{JEL Codes:}} \jela
			\else\fi
			\ifdefined\keywordsa
			    \par\vskip0.2cm
			    {\color{main}\textbf{Key words:}} \keywordsa
	        \else\fi
		}\end{spacing}\end{minipage}
	\else\relax\fi
\end{center}
% Acknowledgments
\ifdefined\thankyou\par\vfill
	\noindent\rule{0.4\textwidth}{0.4pt}\vskip0.1cm{\footnotesize
	\begin{spacing}{1.0}
		{\setlength{\parindent}{0pt}\thankyou}
	\end{spacing}}
	\vskip-0.5cm
\else\fi}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LIST ENVIROMENTS

\setitemize{itemsep=1pt, topsep=5pt, leftmargin=20pt}
\setenumerate{itemsep=1pt, topsep=5pt, leftmargin=20pt}
\setdescription{itemsep=1pt, topsep=5pt, leftmargin=20pt}

% itemize's labels
\def\labelitemi{\scriptsize\raise1.25pt\hbox{\color{main}$\bullet$}}
\def\labelitemii{{\bfseries\color{main}$\circ$}}
\def\labelitemiii{{\bfseries\color{main}$-$}}
\def\labelitemiv{{\bfseries\color{main}$*$}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% USEFULL COMMANDS

\newcommand{\hs}{\hspace{0.1cm}}
\newcommand{\vs}{\vspace{0.1cm}}
\newcommand{\so}{\ \ \ \Rightarrow \ \ \ }
\newcommand{\under}[1]{\underline{\smash{#1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% THEOREMS

% Change the format of theorems and similars:
\newtheoremstyle{mytheoremstyle} 	% Name of the style
    {0.4cm}                    		% Space above
    {0.3cm}                    		% Space below
    {\itshape}                   	% Body font
    {0.0cm}                         % Indent amount
    {\bfseries\color{main}}   		% Theorem head font
    {.}                          	% Punctuation after theorem head
    {.5em}                       	% Space after theorem head
    {}  							% Theorem head spec (can be left empty, meaning "normal")
    
% Set the theorem style to mine
\theoremstyle{mytheoremstyle}

% Defining new theorems
\newtheorem{theorem}{Theorem}
\newtheorem{corollary}{Corollary}
\newtheorem{assumption}{Assumption}
\newtheorem*{definition}{Definition}
\newtheorem{example}{Example}
\newtheorem{lemma}{Lemma}
\newtheorem{proposition}{Proposition}
\newtheorem{hypothesis}{Hypothesis}

% Define Proof enviroment:
\renewcommand*{\proofname}{{\bfseries\upshape\color{main}Proof. }}
\renewcommand{\qedsymbol}{\rule{0.5em}{0.5em}}
