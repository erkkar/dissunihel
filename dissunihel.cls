%% dissunihel.cls
%% Copyright 2026 Erkka Rinne
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Erkka Rinne

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dissunihel}[
    2026/06/11 Class for University of Helsinki dissertations
]

%% Class options
\DeclareOption{onecolumn}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{twocolumn}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{final}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{british}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{american}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{finnish}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{swedish}{\PassOptionsToPackage{\CurrentOption}{babel}}
\ExecuteOptions{british,onecolumn}

\ProcessOptions\relax
\LoadClass[12pt,oneside]{book}

\RequirePackage{babel}
% Rename references title
\addto\captionsenglish{\renewcommand{\bibname}{References}}
\addto\captionsfinnish{\renewcommand{\bibname}{Lähteet}}
\addto\captionsswedish{\renewcommand{\bibname}{Källor}}

%% Use Times and Helvetica fonts
\RequirePackage{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage[scaled=.9]{helvet}  % scale to match Times size
\RequirePackage{ifthen}

%% Set page size and margins
\RequirePackage[
    paper=a4paper,
    hmargin=2.8cm,  % lef tand right margins
    vmargin=2.5cm,  % top and bottom margins
    ignorefoot=true,
]{geometry}


%% Title page
% Custom commands for setting the title page information
\newcommand{\pretitle}[1]{\gdef\@pretitle{#1}}
\newcommand{\posttitle}[1]{\gdef\@posttitle{#1}}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}

%% Custom title page
\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \begin{center}
        \sffamily  % sans-serfi font
        \setlength{\parindent}{0pt}  % no paragrap indents
        % pre-title
        \ifthenelse{\isundefined{\@pretitle}}{
            \vspace{10\baselineskip}
        }{
            \@pretitle\par
            \vspace{7\baselineskip}
        }
        % main title
        {\huge\bfseries\@title\par} 
        % subtitle
        \ifthenelse{\isundefined{\@subtitle}}{}{
            \vspace{12pt}
            {\large\itshape\@subtitle\par}
        }
        \vspace{3\baselineskip}
        % author name
        {\large\@author}
        \par
        \vfill
        % post-title
        \ifthenelse{\isundefined{\@posttitle}}{}{
            \setlength{\parskip}{\baselineskip} % empty line between paragraphs
            \@posttitle\par
        }
        \vspace{2\baselineskip}
    \end{center}
    \newpage
}

%% Heading formatting
\RequirePackage{titlesec}

% chapters
\titleformat{\chapter}[hang]{\LARGE\sffamily\bfseries}{\thechapter}{0.76cm}{}{}
\titlespacing*{\chapter}{0pt}{0pt}{100pt}[0pt]

% sections
\titleformat{\section}[hang]{\raggedright\Large\sffamily\bfseries}{\thesection}{1.02cm}{}{}
\titlespacing*{\section}{0pt}{24pt}{12pt}[0pt]

% subsections
\titleformat{\subsection}[hang]{\raggedright\large\sffamily\bfseries}{\thesubsection}{1.27cm}{}{}
\titlespacing*{\subsection}{0pt}{24pt}{12pt}[0pt]


%% Hyperlinks	
\RequirePackage[hidelinks,breaklinks]{hyperref}
\RequirePackage{url}
\urlstyle{same}  % Typeset URLs with the same typeface


%% Caption formatting
\RequirePackage{caption}
\captionsetup{
    labelfont={sf,bf},  % sans-serif, bold label
    font=small,         % small font size
    format=hang,        % typeset as hanging 
    labelsep=quad,      % separate label and caption with quad space
    justification=justified,
    singlelinecheck=true,  % single-line caption is centered
}
\RequirePackage{subcaption} 
\subcaptionsetup{
    labelformat=simple,
    font=small,
}

%% Numbering of floats: only running number
\RequirePackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{equation}{chapter}

%% Nomenclatures
\RequirePackage[intoc]{nomencl}
\setlength{\nomitemsep}{-0.5\parskip}  % reduce item separation by half
\renewcommand{\nomname}{List of symbols}

%% Select default font size
\renewcommand{\normalsize}{\fontsize{12}{15}\selectfont}

%% Custom environments for the inner cover
% Pre-examiners etc.
\RequirePackage{enumitem}
\newlist{people}{description}{1}
\setlist[people]{
    style=nextline, 
    leftmargin=0pt,
    labelindent=0pt,
    itemindent=0pt,
    labelsep=0pt,
    labelwidth=!,
    font=\bfseries, 
    before={
        \setlength{\parskip}{\baselineskip}
        \addtolength{\baselineskip}{6pt}
    }
}
% Publication data
\newenvironment{pubinfo}{
        \vfill
        \raggedright
        % No paragraph indent but space between
        \setlength{\parindent}{0pt}
        \setlength{\parskip}{\baselineskip}
    }{}

%% Environement for the list of publications
\newlist{publications}{enumerate}{1}
\setlist[publications]{
    label=\textbf{\Roman*}, 
    ref={\Roman*}, 
    align=left,
}
% Custom ref. labels for the publications
\RequirePackage[capitalise,nameinlink,noabbrev,sort&compress]{cleveref}
\crefname{publicationsi}{\textbf{Paper}}{\textbf{Papers}}
\crefformat{publicationsi}{\textbf{Paper~#2#1#3}}
\crefrangeformat{publicationsi}{\textbf{Papers~#3#1#4}–\textbf{#5#2#6}}
\crefmultiformat{publicationsi}{\textbf{Papers~#2#1#3}}{ and~\textbf{#2#1#3}}{, \textbf{#2#1#3}}{ and~\textbf{#2#1#3}}

%% Set default page style
\AtBeginDocument{
    % Set page style to plain
    \pagestyle{plain}
}

%% Avoid orphan and widow lines
\RequirePackage[defaultlines=2,all]{nowidow}

\endinput