
\ProvidesClass{bppaper}[2021 Borja Petit, Template for papers]

% ----------- class options

% page layout
\DeclareOption{narrow}{\def\narrow{1}}

% font family
\DeclareOption{sans}{\def\fontsf{1}}
\DeclareOption{serif}{\def\fontserif{1}}
\DeclareOption{helvetica}{\def\fonthelvet{1}}
\DeclareOption{palatino}{\def\fontpala{1}}

% colors
\DeclareOption{color}{\def\withcolors{1}}

% other options
\DeclareOption{tikz}{\def\tikz{1}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage{enumitem}					% For formatting itemize and enumerate
\RequirePackage{hyperref}					% For links and within-doc citations
\RequirePackage[usenames,dvipsnames]{color}	% Define new colors
\RequirePackage{titlesec}					% Customize section titles
\RequirePackage{scrextend}					% Define footnotes' layout
\RequirePackage[bottom]{footmisc}			% Make footnotes be located at the bottom.

\RequirePackage{amssymb,amsmath,amsthm}		% Math expressions, symbols and theorems.
\RequirePackage{graphicx}					% Include figures
\RequirePackage{booktabs}					% Nice lines for tables
\RequirePackage{setspace}					% Redefine spacing
\RequirePackage{stackengine}                % 
\RequirePackage[normalem]{ulem}                       % Nice underline environment
\RequirePackage{eurosym}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAGE LAYOUT:

\RequirePackage{geometry}  % Define the size of document

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

% Footnotes
\deffootnote[1.8em]{1.8em}{0.0cm}{${\thefootnotemark}.$\enskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FONT FAMILY:

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

% Serif Pro
\ifdefined\fontserif
	\RequirePackage{sourceserifpro}
	\RequirePackage{amsmath,amssymb,amsthm,eucal,bbold,bm}
	\RequirePackage[italic,eulergreek]{mathastext}
	\input{glyphtounicode}\pdfgentounicode=1
\else\relax\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLORS:

\definecolor{main}{RGB}{000,000,000}
\definecolor{colorref}{RGB}{000,000,220} 

% Blue:
\ifdefined\withcolors
	\definecolor{main}{RGB}{000,000,180}
	\definecolor{colorref}{RGB}{000,110,000}
\else\relax\fi

\hypersetup{colorlinks=true,linkcolor=colorref,citecolor=colorref,urlcolor=colorref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TITLES OF SECTION/SUBSECTION/ETC

% Numbering style
\def\thesection{{\arabic{section}}}
\def\thesubsection{\thesection.\arabic{subsection}}
\def\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\let\oldparagraph\paragraph
\renewcommand{\paragraph}[1]{\oldparagraph{#1.}}

% Font style
\titleformat{\section}{\color{main}\Large\bfseries}{\thesection}{0.5em}{}
\titleformat{\subsection}{\color{main}\large\bfseries}{\thesubsection}{0.5em}{}
\titleformat{\subsubsection}{\color{main}\normalsize\bfseries}{\thesubsubsection}{0.5em}{}
\titleformat{\paragraph}[runin]{\color{main}\normalsize\bfseries}{\theparagraph}{}{}


% Spacing
\titlespacing*{\section}{0pt}{0.5cm}{0.5cm}
\titlespacing*{\subsection}{0pt}{0.5cm}{0.4cm}
\titlespacing*{\subsubsection}{0pt}{0.3cm}{0.2cm}
\titlespacing*{\paragraph}{0pt}{0.3cm}{0.2cm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TABLES AND FIGURES

% Packages
\RequirePackage{multirow}		% Merge multiple rows/columns in tables
\RequirePackage{caption}		% Redefine figure/table captions format
\RequirePackage{subcaption} 	% Subfigures

% Captions
\captionsetup{labelsep=period}
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
\else\vfill\fi\clearpage}
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
% THEOREMS

% Change the format of theorems and similars:
\newtheoremstyle{mytheoremstyle}{0.4cm}{0.3cm}{\itshape}{0.0cm}{\bfseries\color{main}}{.}{.5em} {}  							% Theorem head spec (can be left empty, meaning "normal")
    
% Set the theorem style to mine
\theoremstyle{mytheoremstyle}

% Defining new theorems
\newtheorem{theorem}{Theorem}
\newtheorem{example}{Example}
\newtheorem{assumption}{Assumption}
\newtheorem*{definition}{Definition}
\newtheorem{proposition}{Proposition}

% Define Proof enviroment:
\renewcommand*{\proofname}{{\bfseries\upshape\color{main}Proof. }}
\renewcommand{\qedsymbol}{\rule{0.5em}{0.5em}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LOAD TIKZ LIBRARIES

\ifdefined\tikz
    \RequirePackage{tikz}
    \usetikzlibrary{arrows}
    \usetikzlibrary{positioning}
    \usetikzlibrary{patterns}
    \usetikzlibrary{decorations.pathreplacing}
    \usetikzlibrary{decorations.pathmorphing}
\else\relax\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% USEFULL COMMANDS
\RequirePackage{xparse}
\NewDocumentCommand{\hs}{g}{ \IfNoValueTF{#1}{\hspace{0.1cm}}{\hspace{{#1}cm}}}
\NewDocumentCommand{\vs}{g}{ \IfNoValueTF{#1}{\vspace{0.1cm}}{\vspace{{#1}cm}}}
\newcommand{\so}{ \hs{0.5} \to \hs{0.5} }
\newcommand{\llave}[2]{\underbrace{\addstackgap[4pt]{$#1$}}_{{\footnotesize\text{#2}}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BIBLIOGRAPHY

\AtBeginEnvironment{thebibliography}{\setstretch{1.1}}
\RequirePackage[authoryear]{natbib}
\setcitestyle{aysep={}}
\setlength{\bibsep}{10pt}
\setlength{\bibhang}{1.5em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% APPENDDIX

\AfterEndEnvironment{thebibliography}{

	\appendix

	\let\oldsection\section
	\renewcommand{\section}[1]{%
		\setcounter{equation}{0}%
		\setcounter{figure}{0}%
		\setcounter{table}{0}%
		\oldsection{#1.}}

	\renewcommand{\thetable}{\Alph{section}.\arabic{table}}
	\renewcommand{\thefigure}{\Alph{section}.\arabic{figure}}
	\renewcommand{\theequation}{\Alph{section}.\arabic{equation}}
	\renewcommand{\thesection}{\Alph{section}}

	\titleformat{\section}{\color{main}\Large\bfseries}{Appendix~\thesection.}{0.5em}{}
	
}