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
    2026/05/12 Class for Dissertationes Universitatis Helsingiensis
]

%% Class options
\DeclareOption{onecolumn}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{twocolumn}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{final}{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions\relax
\LoadClass[12pt,oneside]{book}

%% Use Times and Helvetica fonts
\RequirePackage{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage{helvet}
\RequirePackage{enumitem}
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
        \setlength{\parindent}{0pt}
        \setlength{\parskip}{\baselineskip}
        \ifthenelse{\isundefined{\@pretitle}}{}{\@pretitle\par}
        \vspace{7\baselineskip}
        {\huge\sffamily\bfseries\@title}\par
        \vspace{12pt}
        \ifthenelse{\isundefined{\@subtitle}}{}{
            {\large\sffamily\itshape\@subtitle\par}
        }
        \vspace{3\baselineskip}
        {\large\sffamily\@author}
        \par
        \vfill
        \ifthenelse{\isundefined{\@posttitle}}{}{\@posttitle}
    \end{center}
    \newpage
}

%% Heading formatting
\RequirePackage{titlesec}

% chapters
\titleformat{\chapter}[hang]{\LARGE\sffamily\bfseries}{\thechapter}{0.76cm}{}{}
\titlespacing*{\chapter}{0pt}{0pt}{100pt}[0pt]

% sections
\titleformat{\section}[hang]{\Large\sffamily\bfseries}{\thesection}{1.02cm}{}{}
\titlespacing*{\section}{0pt}{24pt}{12pt}[0pt]

% subsections
\titleformat{\subsection}[hang]{\large\sffamily\bfseries}{\thesubsection}{1.27cm}{}{}
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
\setlength{\nomitemsep}{0.1ex}
\renewcommand{\nomname}{List of symbols}

%% Select default font size
\renewcommand{\normalsize}{\fontsize{12}{15}\selectfont}

%% Custom environment for the inner cover
\newenvironment{pubinfo}{
        \raggedright
        % No paragraph indent but space between
        \setlength{\parindent}{0pt}
        \setlength{\parskip}{\baselineskip}
    }{\newpage}

%% Environement for the list of publications
\newenvironment{publications}{
    \begin{enumerate}[label=\Roman*, align=left]
}{
    \end{enumerate}
}

%% Set default page style
\AtBeginDocument{
    % Set page style to plain
    \pagestyle{plain}
}

\endinput