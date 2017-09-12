\LoadClass[a5paper]{memoir}
\usepackage{tikz}
\usetikzlibrary{backgrounds}
\usepackage[mono=false]{libertine}
\setmonofont[Scale=MatchLowercase]{DejaVu Sans Mono} % see the "fonts" folder
\usepackage{iflang}
\usepackage[libertine]{newtxmath}
\usepackage{amsfonts}
\usepackage{enumitem}
\usepackage{multicol}
\usepackage{todonotes}
\usepackage[main=english,ngerman]{babel}
\usepackage[
backend=biber,
natbib=true,
style=authoryear-comp
]{biblatex}
%Citation style
\renewcommand*{\nameyeardelim}{\addspace} 
\renewcommand{\postnotedelim}{:\ }
\DefineBibliographyStrings{english}{%
	bibliography = {\normalfont References · Literaturverzeichnis}
}
\addto\captionsenglish{%
	\renewcommand\contentsname{Contents · Inhaltsverzeichnis}
}
\renewcommand*{\indexname}{Name index · Personenverzeichnis}
\usepackage[draft=false,breaklinks=true,colorlinks,hidelinks]{hyperref}
\usepackage{gb4e}
\noautomath
\newcommand{\citegen}[1]{\citeauthor{#1}'s (\citeyear{#1})}
\newcommand{\shorttitle}{\@title}
\usepackage{chngcntr}
\setcounter{tocdepth}{0}
\renewcommand*{\cftchaptername}{\normalfont}
\renewcommand*{\cftchapterpagefont}{\normalfont}
\counterwithin{exx}{chapter} 
\renewcommand*{\footnoterule}{}
\setlength{\footparindent} {0em}
\setlength{\footmarkwidth} {0em}
\setlength{\footmarksep}   {0em}
\footmarkstyle{\textsuperscript{#1}\,}

% PAGESTYLES
\makepagestyle{plain}
\makeevenhead{plain}{{\thepage}}{\itshape{\@author}}{}
\makeoddhead{plain}{}{\itshape{\shorttitle}}{{\thepage}}
\makepagestyle{intropage}
\makeevenhead{intropage}{}{}{}
\makeoddhead{intropage}{}{}{}
\makeevenfoot{intropage}{}{{\thepage}}{}
\makeoddfoot{intropage}{}{{\thepage}}{}
\makepagestyle{bibliography}
\makeevenhead{bibliography}{{\thepage}}{\bibname}{}
\makeoddhead{bibliography}{}{\bibname}{{\thepage}}
\makepagestyle{index}
\makeevenhead{index}{{\thepage}}{\indexname}{}
\makeoddhead{index}{}{\indexname}{{\thepage}}
\makepagestyle{contents}
\makeevenhead{contents}{{\thepage}}{\contentsname}{}
\makeoddhead{contents}{}{\contentsname}{{\thepage}}
\pagestyle{plain}
\chapterstyle{southall}

\renewcommand*{\afterchaptertitle}{%
	\thispagestyle{intropage}
	\hspace*{\beforechapskip}\begin{minipage}[t]{5cm}
		{\vspace{\baselineskip}\Large \textit{\IfLanguageName{english}{by}{von} \@author}\par}
	\end{minipage}
	\par\vspace{\baselineskip}
	\vskip\afterchapskip}

\renewcommand*{\aftertoctitle}{%
	\thispagestyle{empty}
	\par\vspace{\baselineskip}%
	\vskip\afterchapskip}

\newenvironment{collectionpaper}{
	\renewcommand{\documentclass}[2][]{}%
	\renewcommand{\usepackage}[2][]{}%
	\renewenvironment{document}{\begingroup}{\endgroup}%
	\studPaper
}

\newcommand{\includepaper}[1]{\begin{collectionpaper}\include{#1}\end{collectionpaper}\cleardoublepage}

\newcommand{\studPaper}{
	\renewcommand{\maketitle}{
		\chapter[{\normalfont\textit{\@author}~\newline\@title}]{\@title}
	} 
	\renewcommand*{\thesection}{\arabic{section}}
	\setcounter{section}{0}
	\setcounter{footnote}{0}
	\setcounter{figure}{0}
	\setcounter{table}{0}
	\setcounter{equation}{0}
}

% Automatic paragraph control. Thank you, memoir class!
\sloppybottom
\traditionalparskip
% Finishing with memoir's magic
\setulmarginsandblock{*}{\foremargin}{1}%\setlength{\uppermargin}{\the\foremargin}
\checkandfixthelayout