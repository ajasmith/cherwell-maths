% cherwellmaths.cls — Document class for Cherwell maths presentations
% Wraps Beamer with A4 landscape and school branding
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cherwellmaths}[2026/05/06 Cherwell School maths slide class]

% Pass accessible option through to Beamer as handout mode
\newif\ifcherwellhandout
\DeclareOption{accessible}{\cherwellhandouttrue\PassOptionsToClass{handout}{beamer}}
\ProcessOptions\relax

% Load Beamer with A4 landscape geometry
\PassOptionsToClass{aspectratio=141}{beamer}
\LoadClass[20pt]{beamer}
\RequirePackage{geometry}
\geometry{paperwidth=297mm, paperheight=210mm}

% Accessible mode: larger text, portrait orientation
\ifcherwellhandout
  \geometry{paperwidth=210mm, paperheight=297mm}
  \RequirePackage{scrextend}
  \changefontsizes{30pt}
\fi

% --- Core packages ---
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{ifthen}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18, every axis plot/.append style={very thick}}
\RequirePackage{cancel}
\RequirePackage{siunitx}
\RequirePackage{booktabs}
\RequirePackage{tcolorbox}
\tcbuselibrary{theorems,skins,breakable}
\RequirePackage{transparent}

% --- Beamer theme setup ---
\usetheme{Madrid}
\usecolortheme{seahorse}
\usefonttheme{professionalfonts}
\setbeamersize{text margin left=8mm, text margin right=8mm}
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{footline}[frame number]
\setbeamertemplate{itemize items}[circle]
\setbeamertemplate{sections/subsections in toc}[circle]
\date{}

% --- Title page styling ---
\setbeamertemplate{title page}[default][rounded=true,shadow=false]
\setbeamerfont{title}{series=\bfseries}
\setbeamerfont{frametitle}{series=\bfseries,size=\large}
\setbeamertemplate{frametitle}{%
  \nointerlineskip
  \begin{beamercolorbox}[wd=\paperwidth,sep=0.5em,left]{frametitle}
    \boldmath\usebeamerfont{frametitle}\insertframetitle
  \end{beamercolorbox}%
}
\setbeamercolor{title}{fg=cherwellwhite,bg=cherwellaccent}
\setbeamercolor{palette primary}{fg=cherwellwhite,bg=cherwellaccent}
\setbeamercolor{palette secondary}{fg=cherwellblack,bg=cherwellgrey}
\setbeamercolor{palette tertiary}{fg=cherwellwhite,bg=cherwellblack}

% Swan logo centered below author on title page
\addtobeamertemplate{title page}{}{\begin{center}\includegraphics[height=5cm]{swan.pdf}\end{center}}
\addtobeamertemplate{title page}{}{\addtocounter{framenumber}{-1}}

% --- Branding ---
\RequirePackage{graphicx}
\graphicspath{{assets/}}
\RequirePackage{adjustbox}
\newlength{\cherwellpadding}
\setlength{\cherwellpadding}{3mm}

\ifcherwellhandout
  % Handout: no branding, no background, simple page numbers
  \setbeamertemplate{background}{}
  \setbeamertemplate{footline}[frame number]
\else
  % Presentation: full branding

  % Background image (aligned to bottom, maintain aspect ratio, cropped)
  \setbeamertemplate{background}{%
   \transparent{0.025}{\includegraphics[width=\paperwidth]{swan.pdf}}
  }

  % Banner in the top-right corner
  \addtobeamertemplate{headline}{}{%
    \vspace{\cherwellpadding}%
    \hfill%
    \includegraphics[height=8mm]{cherwellbanner}%
    \hspace{\cherwellpadding}%
    \vspace{\cherwellpadding}\par
  }

  % Swan logo centered above page number (hidden on title/TOC pages)
  \setbeamertemplate{footline}{%
    \ifnum\insertframenumber<1\else
    \hfill
    \begin{minipage}[b]{4cm}
      \centering
      \hyperlink{toc}{\includegraphics[height=1.5cm]{swan.pdf}}\\[2pt]
      \usebeamerfont{frame number}\insertframenumber/\inserttotalframenumber
    \end{minipage}%
    \hspace{0mm}\vspace{\cherwellpadding}\par
    \fi
  }
\fi

% --- Fonts ---
\RequirePackage[T1]{fontenc}
\RequirePackage[default]{opensans}

% --- Colours ---
\definecolor{cherwellblack}{HTML}{000000}
\definecolor{cherwellwhite}{HTML}{FFFFFF}
\definecolor{cherwellgrey}{HTML}{D3D3D3}
\ifcherwellhandout
  \definecolor{cherwellaccent}{HTML}{000000}
\else
  \definecolor{cherwellaccent}{HTML}{23ACC3}
\fi
\setbeamercolor{structure}{fg=cherwellaccent}
\setbeamercolor{normal text}{fg=cherwellblack,bg=cherwellwhite}
\setbeamercolor{frametitle}{fg=cherwellwhite,bg=cherwellaccent}
\setbeamercolor{item}{fg=cherwellaccent}

% --- Theorem-like environments via tcolorbox ---
\newtcbtheorem[number within=section]{defn}{Definition}{
  colback=cherwellgrey!30, colframe=cherwellaccent,
  fonttitle=\bfseries, separator sign={.~}
}{def}

\newtcbtheorem[number within=section]{thm}{Theorem}{
  colback=cherwellgrey!30, colframe=cherwellaccent,
  fonttitle=\bfseries, separator sign={.~}
}{thm}

\newtcbtheorem[number within=section]{exmp}{Example}{
  colback=cherwellgrey!30, colframe=cherwellaccent,
  fonttitle=\bfseries, separator sign={.~}
}{exmp}

% Prevent counters incrementing on each overlay
\resetcounteronoverlays{tcb@cnt@defn}
\resetcounteronoverlays{tcb@cnt@thm}
\resetcounteronoverlays{tcb@cnt@exmp}
\resetcounteronoverlays{section}
\resetcounteronoverlays{subsection}
\resetcounteronoverlays{equation}
\resetcounteronoverlays{figure}
\resetcounteronoverlays{table}
\resetcounteronoverlays{framenumber}

% --- Convenience macros ---
\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\set}[1]{\left\{ #1 \right\}}
\newcommand{\highlight}[1]{\textcolor{cherwellaccent}{\mathbf{#1}}}

% --- Available-space dimensions ---
% Use \slidewidth and \slideheight instead of \textwidth and \textheight
% inside frames so content adapts to columns, minipages, etc.
% If you want a length that will look reasonable in all layouts, use \slidesquare
% for the maximal square size that fits within the available space.
\newlength{\slidewidth}
\newlength{\slideheight}
\newlength{\slidesquare}
\setlength{\slidewidth}{\textwidth}
\setlength{\slideheight}{\textheight}
\newcommand{\updateslidesquare}{\setlength{\slidesquare}{\minof{\slidewidth}{\slideheight}}}
\newcommand{\updateslideheight}[1]{\setlength{\slideheight}{#1}\updateslidesquare}
\newcommand{\updateslidewidth}[1]{\setlength{\slidewidth}{#1}\updateslidesquare}
\updateslidesquare


% --- Side-by-side layout ---
% Usage: \sidebyside{left content}{right content}
% In accessible mode, content stacks vertically instead.
\newcommand{\sidebyside}[2]{%
  \ifcherwellhandout
    \updateslideheight{0.45\textheight}%
    \begin{minipage}[c][0.45\textheight][c]{\textwidth}#1\end{minipage}\par
    \begin{minipage}[c][0.45\textheight][c]{\textwidth}#2\end{minipage}%
    \updateslideheight{\textheight}%
  \else
    \updateslidewidth{0.48\textwidth}%
    \begin{columns}[T]
      \begin{column}{0.48\textwidth}#1\end{column}
      \begin{column}{0.48\textwidth}#2\end{column}
    \end{columns}
    \updateslidewidth{\textwidth}%
  \fi
}

% --- Hyperlinks ---
\RequirePackage{hyperref}

% --- TikZ libraries commonly used in maths teaching ---
\usetikzlibrary{arrows.meta, calc, angles, quotes, patterns, intersections}

% --- Auto-generate title page and table of contents ---
\AtBeginDocument{%
  \begin{frame}
    \titlepage
    \thispagestyle{empty}
  \end{frame}
  {%
    \setbeamertemplate{footline}{}%
    \begin{frame}{Outline}
      \hypertarget{toc}{}%
      \tableofcontents
      \addtocounter{framenumber}{-1}
    \end{frame}
  }
}

\endinput
