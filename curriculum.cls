\ProvidesClass{curriculum}
\NeedsTeXFormat{LaTeX2e}
\LoadClass[11pt]{article}

\setlength\paperheight {297mm}
\setlength\paperwidth {210mm}

\RequirePackage[super]{nth}

% colors
\RequirePackage{xcolor}
\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\colorlet{fillheader}{white}
\colorlet{header}{gray}
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}
\colorlet{headercolor1}{lightgray}

%fonts
\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}
\newfontfamily\bodyfont[]{Roboto Condensed}
\newfontfamily\thinfont[]{Roboto Light}
\newfontfamily\headingfont[]{Roboto Condensed Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Roboto Condensed}

% top header
\RequirePackage{tikz}
\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\RequirePackage{parskip}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\bodyfont #1}{\bodyfont \ #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{gray}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.0cm}
  \vspace{-1\parskip}
}



\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        gray\or%
        gray\or%
        gray\or%
        gray\or%
        gray\or%
        gray\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{header}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}


\newenvironment{entrylist}{%
  \begin{itemize}[leftmargin=1in]
}{%
  \end{itemize}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  \item[#1]
    \textbf{#2}%
    \hfill%
    {\\\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{3 pt}%
}


%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%
\RequirePackage{csquotes}
\RequirePackage[style=verbose, maxnames=99, sorting=ydnt, language=english]{biblatex}
\renewcommand*{\revsdnamepunct}{}
\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[incollection]{title}{#1\par}
%\DeclareFieldFormat[misc]{title}{#1\par}
%\DeclareFieldFormat[report]{title}{#1\par}


\DeclareBibliographyDriver{article}{%
    \printnames{author}
    \newblock%
    {
        \\
        \itshape
        \printfield{title}%
    }
    \par
    \newblock%
    {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    %\printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{volume}%
    \setunit{\addcomma\space}%
    \printfield{pages}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

% \DeclareBibliographyDriver{misc}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \printfield{booktitle}%
%     \setunit*{\addcomma\space}%
%     \printfield{note}%
%     \setunit*{\addcomma\space}%
%     \printfield{year}%
%     \setunit{\addcomma\space}%
%     \printlist{location}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }


\DeclareBibliographyDriver{incollection}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{volume}%
    \setunit{\addcomma\space}%
    \printfield{pages}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

% \DeclareBibliographyDriver{report}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \printfield{type}%
%     \setunit{\space}%
%     \printfield{number}%
%     \setunit{\addcomma\space}%
%     \printfield{year}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }


\newbibmacro{name:newformat}{%
   \namepartfamily  % #1->\namepartfamily, #2->\namepartfamilyi
   \namepartgiven  % #3->\namepartgiven,  #4->\namepartgiveni
   [prefix: \namepartprefix] % #5->\namepartprefix, #6->\namepartprefixi
   [suffix: \namepartsuffix] % #7->\namepartsuffix, #8->\namepartsuffixi
}

\DeclareNameFormat{newformat}{%
  \nameparts{#1}% split the name data, will not be necessary in future versions
  \usebibmacro{name:newformat}%
  \usebibmacro{name:andothers}%
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
  \end{refsection}
}

\DeclareSortingTemplate{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}


\RequirePackage{enumitem}
\RequirePackage[left=2.5cm,top=2.5cm,right=2.5cm,bottom=2.5cm]{geometry}
\RequirePackage{microtype}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{caption}
\RequirePackage{perpage}
\RequirePackage{hologo}

