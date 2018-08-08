\ProvidesClass{curriculum}
\NeedsTeXFormat{LaTeX2e}
\LoadClass{article}

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

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\bodyfont #1}{\bodyfont \ #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}

\RequirePackage{parskip}
\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        gray\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}


% no number of pages etc
\pagestyle{empty}

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{microtype}
\RequirePackage{enumitem}

