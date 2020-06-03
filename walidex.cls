 \NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{walidex}[24/05/2020 v1]

% La classe manEN2019.cls s'appuie sur la structure de la classe book
% pour le sectionnage (chapter, section ...)
 
\LoadClassWithOptions{report}
%\RequirePackage{mathpazo} % Police d'écriture

\RequirePackage[a4paper,margin=2cm,
    %showframe,
    top=128pt,
    height=620pt,
    headheight=20pt,
   % headsep=80pt
  ]{geometry}
%
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx,atbegshi,lastpage}
\RequirePackage{lipsum}
\RequirePackage{enumitem}
\RequirePackage{url}
\RequirePackage{adforn} %decoration gliphs
\RequirePackage[pageanchor=true
,pdfstartview=FitH,
colorlinks=true,linkcolor=black,urlcolor=red ,bookmarks=true,
bookmarksopen=true,
bookmarksnumbered=true]{hyperref}
\RequirePackage{bookmark}
\RequirePackage{eso-pic}
\bookmarksetup{color=red,bold,
}
%\bookmark[named=FirstPage,color=red]{صفحة الغلاف}
\bookmark[named=FirstPage,color=blue]{قائمة المحتويات}
%
\RequirePackage{tikz}
\usetikzlibrary{positioning,calc}  
\usetikzlibrary{shapes}
%\RequirePackage[absolute]{textpos}
\RequirePackage{xkeyval}
%\RequirePackage{alphalph}
%\RequirePackage{ifthen}
\RequirePackage{xifthen}
\RequirePackage{totcount}
\RequirePackage[contents={}]{background}
%\RequirePackage[absolute,overlay]{textpos}

\RequirePackage{eso-pic}
\RequirePackage{mdframed}
\RequirePackage{tikz,fancyhdr,titletoc}
\RequirePackage{kpfonts}
\RequirePackage[arabic]{minitoc}
\RequirePackage{framed}
%\RequirePackage[compact,pagestyles,clearempty]{titlesec}
\RequirePackage[explicit]{titlesec}
 \usetikzlibrary{calc,fadings}
 \usetikzlibrary{shapes.geometric} % 
\usetikzlibrary{shadows.blur,positioning}
\definecolor{secnum}{RGB}{13,151,225}
\definecolor{ptcbackground}{RGB}{212,237,252}
\definecolor{ptctitle}{RGB}{0,177,235}

\pretocmd{\tableofcontents}{\begin{mdframed}[backgroundcolor=ptcbackground,hidealllines=true]}{}{}
\apptocmd{\tableofcontents}{\end{mdframed}}{}{}
\patchcmd{\tableofcontents}{\contentsname}{\color{ptctitle}\contentsname}{}{}
\definecolor{ao}{rgb}{0.0, 0.5, 0.0}
\definecolor{titlecolor}{RGB}{13,151,225}
\definecolor{headcolor2}{RGB}{212,237,252}
\definecolor{headcolor}{RGB}{0,177,235}
\definecolor{KLEIN}{HTML}{002fa7}
\definecolor{RED}{HTML}{ff0000}
%%%
\RequirePackage{polyglossia}
\setdefaultlanguage[calendar=gregorian,locale=algeria]{arabic}
\setotherlanguage{english}
\newfontfamily\arabicfont[Script=Arabic,Scale=1.2]{Amiri}
\newfontfamily\arabicfontsf[Script=Arabic,Scale=1.2]{Aref Ruqaa}
\newfontfamily\arabicfonttt[Script=Arabic,Scale=1.2]{Aljazeera}
%%
\newcount\segmentsleft
\tikzset{pics/.cd,
circle fraction/.style args={#1/#2}{code={%
\segmentsleft=#1\relax
\pgfmathloop
\ifnum\segmentsleft<1\else
\ifnum\segmentsleft<#2 \edef\n{\the\segmentsleft}\else\def\n{#2}\fi
\begin{scope}[shift={(\pgfmathcounter,0)}]
\foreach \i [evaluate={\a=360/#2*(\i-1)+90;}] in {1,...,\n}
\fill[fill=\mycolor] (0,0) -- (\a:0.8) arc (\a:\a+360/#2:0.8) -- cycle;
%\draw[white] circle [radius=1.5];
\draw[\mycolor] circle [radius=0.8];
\ifnum#2>1
\foreach \i [evaluate={\a=360/#2*(\i-1);}] in {1,...,#2}
\draw[white] (0,0) -- (90+\a:0.8);
\node[circle,draw=\mycolor,fill=white,minimum width=0.5cm,align=center] at (0,0){\ttfamily \thepage
};
\fi
%
\end{scope}
\advance\segmentsleft by-#2
\repeatpgfmathloop
}}
}
%%%
\newcommand*\chapterlabel{}
\titleformat{\chapter}
  {\gdef\chapterlabel{}
   \normalfont\sffamily\Huge\bfseries\scshape}
  {\gdef\chapterlabel{\thechapter\ }}{0pt}
  {
  \begin{tikzpicture}[remember picture,overlay, withShadow/.style={
      blur shadow={
        shadow blur steps=10,
        shadow blur extra rounding=2pt, 
        shadow xshift=1pt,
        shadow yshift=-2pt
      }
    }]
    \pgfmathtruncatemacro{\mytotalchapters}{\totvalue{chapter} > 0 ? \totvalue{chapter} : 20}
            \ifcase\thechapter
                \xdef\mycolor{ptcbackground}
                \or \xdef\mycolor{red}
                \or \xdef\mycolor{ao}
                \or \xdef\mycolor{blue}
                \or \xdef\mycolor{violet}
                \or \xdef\mycolor{blue}
                \or \xdef\mycolor{violet}
                \else \xdef\mycolor{black}
            \fi
 {
        \fill[\mycolor,withShadow,] ($(current page.north west)+(0,0)$)        ..
        controls+(-68:3.2)and+(120:4.25)..
      % ($(current page.north west)+(4,-3)$)--
          ($(current page.north east)+(-6,-3)$)
 arc(180:42:1.5)         
         --
($(current page.north east)+(-2,-2)$)arc(180:0:0.5)
--
($(current page.north east)+(-1,-4)$) ..
controls+(270:1)and+(120:0)..
($(current page.north east)+(0,-5)$)--
($(current page.north east)+(0,0)$)  
--cycle;
\fill[\mycolor,path fading=circle with fuzzy edge 20 percent]  ($(current page.north east)+(-4.5,-3)$) circle(1.2cm)  
        node[align=center,xshift=0.4cm] (c1)
              {\fontsize{70}{70} \selectfont 
\color{white}
$\chapterlabel$ 
              };
\fill[\mycolor!10,withShadow, ]
($(current page.north east)+(-3.2,-2.1)$)--
($(current page.north east)+(-1.9,-2.1)$)arc(180:0:0.4)--
($(current page.north east)+(-1.1,-3)$)--
($(current page.north east)+(-3.2,-3)$)--cycle             
 node [font=\Large,xshift=+1cm,yshift=-0.4 cm]{\ttfamily \color{\mycolor} المحور};
 %
\draw[\mycolor,line width=0.3cm]($(current page.south west)+(0,0.8)$)--($(current page.south)+(-3,0.8)$) 
node[right,font=\small]{\RL{ \color{black} #1  }};
\draw[\mycolor,line width=0.1cm]($(current page.south west)+(0,0.5)$)--($(current page.south)+(-3,0.5)$);
%rosseur
%\clip ($(A)+(-.1\textwidth,0)$) rectangle ($(B)+(\textwidth,0)$);
%$(B)+(.66\textwidth,0)$:
\begin{scope} 
\fill[\mycolor ,rounded corners=5pt,withShadow,] ($(current page.north west)+
(+3,-1.4cm)$)rectangle
($(current page.north)+
(1,-3.4cm)$);
\foreach \y in {.01,.05,...,.4}{
\fill[draw=black,fill=gray!10] ($(current page.north)+
(-\y\textwidth,-1.6cm)$) circle (1mm) ($(current page.north)+(-\y\textwidth,-0.9cm)$) circle (1mm) ;
\draw[line width=0.5mm,\mycolor,double=yellow, line cap=round]($(current page.north)+
(-\y\textwidth,-1.6cm)$) arc (270:90:{1.6mm} and {3.5mm});
}
\end{scope}
\node[align=center] at ($(current page.north)+(-3.5,-2.4)$)
{\RL{\sffamily \color{white} #1  }};}
%
\fill[\mycolor,withShadow,] 
 ($(current page.south east)+(-2,1)$)arc(180:90:1)--
($(current page.south east)+(-1,1.8)$)--
%
($(current page.south east)+(-1,4)$)..
controls+(90:1)and+(210:0)..
($(current page.south east)+(0,5)$)
%
--
($(current page.south east)+(0,0.9)$)
arc(0:220:0.8cm)--($(current page.south)+(5,0.4)$)
..controls+(90:0.7)and+(210:0)..
($(current page.south)+(6,+1)$)--cycle;
\end{tikzpicture}  
  }
\titlespacing*{\chapter}{0pt}{20pt}{0pt}
%%%%%toc section
%%%%%toc section
%%%%%%%%%%%%%%%%%%%%%%%%%hypperlink
\tikzset{
    hyperlink node/.style={
        alias=sourcenode,
        append after command={
            let             \p1 = (sourcenode.north west),
                \p2=(sourcenode.south east),
                \p3 = (sourcenode.south west),
                \n1={\x2-\x1},
                \n2={\y1-\y2},
                \n3={atan2(\y2-\y3,\x2-\x3)},
                \n4={veclen(\y2-\y3,\x2-\x3)},
                \n5={veclen(\y1-\y3,\x1-\x3)}
                 in
            node [inner sep=0pt, outer sep=0pt,anchor=south
            west,at=(\p3),rotate=\n3]
            {\hyperlink{#1}{\XeTeXLinkBox{\phantom{\rule{\n4}{\n5}}}}}
                    %xelatex needs \XeTeXLinkBox, won't create a link unless it
                    %finds text --- rules don't work without \XeTeXLinkBox.
                    %Still builds correctly with pdflatex and lualatex
        }
    }
}
% to have access to the total number of chapters
  
\regtotcounter{chapter}
%%
%
% every chapter starts on a new page
\pretocmd{\chapter}{\clearpage}{}{}

% auxiliary lengths for the height of the frame and the width of each tab
\newlength\mylen
\newlength\mylena
%
%
% style for the chapter tabs
\tikzset{
tab/.style={
  text width=\mylena,
  thick,
  rectangle,
  rounded corners=0pt,
  align=center,
  text width=53pt,
  inner sep=-5pt,
  fill=\mycolor!10,
  font=\ttfamily\LARGE, 
  }
}
% style for the current chapter tab
\tikzset{selectedtab/.style={tab, rectangle, ,text width=68pt, rounded corners=8pt,color=white,inner sep=-3pt,fill=\mycolor,font=\ttfamily\LARGE}}
% the page number is showed in the background material
%\pagestyle{empty}

\AtBeginDocument{
% calculation of the width for each tab
\setlength\mylen{\dimexpr\textheight+2cm\relax}
\ifnum\totvalue{chapter}>0
\setlength\mylena{\dimexpr\mylen/\totvalue{chapter}\relax}
\fi

% the main part; as background material we place the border, 
% the chapter (current and other) tabs and the page number 
\newcommand\DeactivateBG{\backgroundsetup{contents={}}}
\newcommand\ActivateBG{
\backgroundsetup{
%position=current page.north west,
scale=0.8,
color=black,
angle=0,
opacity=1,
contents= {
%
  \begin{tikzpicture}[remember picture, overlay]  
\pgfmathtruncatemacro{\mytotalchapters}{\totvalue{chapter} > 0 ? \totvalue{chapter} : 20}
            \ifcase\thechapter
                   \xdef\mycolor{ptcbackground}
                \or \xdef\mycolor{red}
                \or \xdef\mycolor{ao}
                \or \xdef\mycolor{blue}
                \or \xdef\mycolor{violet}
                \or \xdef\mycolor{blue}
                \or \xdef\mycolor{violet}
                \else \xdef\mycolor{black}
            \fi
 { \node[
    inner sep=0pt,
    text width=\the\dimexpr\textwidth+2.7cm\relax
  ] 
    at (current page.north west) (border) {\rule{0pt}{\dimexpr\textheight-6cm\relax}};}{
  \foreach \valchapter in {0,...,\numexpr\totvalue{chapter}-1\relax}
  {
    \node[hyperlink node=sec:\valchapter,
      \ifnum\thechapter<\numexpr\valchapter+1\relax 
        tab%
      \else 
      \ifnum\thechapter>\numexpr\valchapter+1\relax 
        tab%
      \else 
      selectedtab%
      \fi\fi,
      minimum height=\mylena
      ] 
      at ([yshift=-(.5+\valchapter)*\mylena]border.north west) 
      (tab-\valchapter) 
      {\hspace*{0pt}\rotatebox{+90}{%
        {\textarabic{\ttfamily\chaptername \the\numexpr\valchapter+1\relax}}%
        }
      };
  }}
\end{tikzpicture}}
  }
}
  }
%
%
%
\cfoot{}
\fancypagestyle{plain}{\fancyhf{}}

 \fancypagestyle{IHA-fancy-style}{%
  \fancyhf{}
\fancyhead[LO,RE]{  
 \begin{tikzpicture}[overlay,remember picture,withShadow/.style={
      blur shadow={
        shadow blur steps=10,
        shadow blur extra rounding=2pt, 
        shadow xshift=1pt,
        shadow yshift=-2pt
      }}]
\fill[ \mycolor!10,withShadow,line width=2pt]
 ($(current page.north east)+(-1.5,-0.5)$) rectangle
 ($(current page.south east)+(0,1.8)$); 
  %
%
\fill[draw= \mycolor,fill=\mycolor!10,line width=2pt,,withShadow]
($(current page.north)+(0,0)$)-- 
($(current page.north)+(-1,-0.6)$)--
($(current page.north)+(0,-1.2)$)--
($(current page.north east)+(2,-1.2)$)--
($(current page.north east)+(1,0)$)--cycle
; 
\fill[draw= gray,fill=\mycolor]
($(current page.north)+(0,-0.2)$)-- 
($(current page.north)+(-0.8,-0.6)$)--
($(current page.north)+(0,-1)$)--cycle;
%()
\fill[\mycolor,withShadow] 
($(current page.north east)+(-2.2,0)$)
[rounded corners=6pt]
--
($(current page.north east)+(-2.2,-1)$)--
($(current page.north east)+(-1,-1)$)
[rounded corners=0pt]--
($(current page.north east)+(-1,-4)$) ..
controls+(270:1)and+(120:0)..
($(current page.north east)+(0,-5)$)--
($(current page.north east)+(0,0)$)  
--cycle;    
   %
   \fill[\mycolor,withShadow,] 
 ($(current page.south east)+(-2,1)$)arc(180:90:1)--
($(current page.south east)+(-1,1.8)$)--
%
($(current page.south east)+(-1,4)$)..
controls+(90:1)and+(210:0)..
($(current page.south east)+(0,5)$)
%
--
($(current page.south east)+(0,0.9)$)
arc(0:220:0.8cm)--($(current page.south)+(5,0.4)$)
..controls+(90:0.7)and+(210:0)..
($(current page.south)+(6,+1)$)--cycle;
\node(ab) at ($(current page.north east)+(-5,-0.6)$){\large{\RL{\ttfamily \color{\mycolor}  \rightmark }}};
\node[rotate=90,draw=\mycolor, rectangle,rounded corners=5pt,fill=\mycolor,inner sep=02pt] at ($(current page.east)+(-0.7,0)$){\LARGE{\RL{\ttfamily \color{white} \leftmark }}};
%
\draw[\mycolor,line width=0.3cm]($(current page.south west)+(0,0.8)$)--($(current page.south)+(-3,0.8)$) ;
\draw[\mycolor,line width=0.1cm]($(current page.south west)+(0,0.5)$)--($(current page.south)+(-3,0.5)$);
%
 %
%rosseur
%rosseur
\end{tikzpicture}
   }
\fancyfoot[R]{\scalebox{0.9}{
  \begin{tikzpicture}[xshift=+0.485cm,yshift=+0.92cm,overlay]
  \ifnum \getpagerefnumber{LastPage}>0
%
  \begin{scope}%[shift={(2cm,0) },overlay]
\foreach \numerator/\denominator [count=\y]
in {\value{page}/\getpagerefnumber{LastPage}}{
\pic at (0, -\y) {circle fraction={\numerator/\denominator}};
}
\end{scope}
 \else \relax \fi 
 %  
  \end{tikzpicture} }
  %
%
}\renewcommand{\headrulewidth}{0pt}% Line at the header visible
  \renewcommand{\footrulewidth}{0pt}}% Custom footer
  % Line at the footer visible
%}
\renewcommand{\headrulewidth}{0pt}% Line at the header visible
  \renewcommand{\footrulewidth}{0pt}
  \patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}
 %%
%
 \addto\captionsarabic{%
  \renewcommand{\chaptername}{ المحور}%
   \renewcommand{\mtctitle}{\ttfamily{ عناويـن المحور :}}
 % \renewcommand{\contentsname}{\leter f}% 
}
 %%%%%%%%%%%%%%
%%%
%%%
%%%%%%%minitoc
\mtcsettitle{minitoc}{}
\mtcsetrules{*}{off}
%\mtcsetoffset{minitoc}{-4.0em}  % To shift the minitoc to the left, if needed!
\setlength{\mtcindent}{+2em}
  \newcommand{\printmyminitoc}{%
    \vskip-0.9cm
  \setcounter{secnumdepth}{3} 
    \setcounter{tocdepth}{-1}
    \noindent\hspace{-0.5cm}%
    %\colorlet{secnumbercolor}{white}%
    \begin{tikzpicture}
    \node[fill=\mycolor!10,align=left, blur shadow={shadow blur steps=5},inner sep=2mm](min){%
        \color{\mycolor}%      
        \begin{minipage}{12cm}%minipage trick
     \begin{RTL}
       {\minitoc}
        \end{RTL}
        \end{minipage}};
        \draw[rounded corners,line width=6pt,\mycolor](min.north east)--(min.north west)--([yshift=-0.5cm]min.north west);
                \draw[rounded corners,line width=6pt,\mycolor]([yshift=0.5cm]min.south east)--
                (min.south east)
                --(min.south west);
    \end{tikzpicture}} %
    %%%%%%%%%%%%%section
\newcommand\SecTitle[1]{%
\begin{tikzpicture}
\node (numsec) {\bf\thesection};
\fill[rounded corners=2pt,fill=gray] ($(numsec.north west)+(2pt,-2pt)$) -- ($(numsec.north east)+(1mm,0mm)+(2pt,-2pt)$) -- ($(numsec.south east)+(2pt,-2pt)$) -- ($(numsec.south west)+(-1mm,0)+(2pt,-2pt)$) -- cycle;
\fill[rounded corners=2pt,fill=\mycolor] (numsec.north west) -- ($(numsec.north east)+(1mm,0mm)$) -- (numsec.south east) -- ($(numsec.south west)+(-1mm,0)$) -- cycle;
\node[white] at (numsec) {\bf\thesection};
\node[\mycolor,left  =0.5cm of numsec] {\RL{\Large\sffamily#1}};
\end{tikzpicture}%
}
\titleformat{\section}
{\normalfont}{}{0em}
{\SecTitle{#1}}
%%%
% Fixing the appearance of the footer in the empty pages in between chapters.
\let\origdoublepage\cleardoublepage
\renewcommand{\cleardoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}
% Finished fixing appearance

\titlecontents{section}
  [4em]{\sffamily}
  {\color{secnum}\contentslabel{2.3em}\normalcolor}{}
  {\titlerule*[1000pc]{.}\contentspage\\\hspace*{-3em}\vspace*{2pt}%
    \color{white}\rule{\dimexpr\textwidth-20pt\relax}{1pt}}

\titlecontents{lsection}
  [5.8em]{\sffamily}
  {\color{secnum}\contentslabel{2.3em}\normalcolor}{}
  {\titlerule*[1000pc]{.}\contentspage\\\hspace*{-5.8em}\vspace*{2pt}%
    \color{white}\rule{\dimexpr\textwidth-15.5pt\relax}{1pt}}

\makeatletter
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth>\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \colorbox{ptctitle}{\strut%
        \makebox[\dimexpr\textwidth-2\fboxsep-7pt\relax][l]{%
          \color{white}\bfseries\sffamily#1%
          \nobreak\hfill\nobreak\hb@xt@\@pnumwidth{\hss #2}}}\par\smallskip
      \penalty\@highpenalty
    \endgroup
  \fi}
\makeatother
\newcommand\PartialToC{%
\startcontents[chapters]%
\begin{mdframed}[backgroundcolor=ptcbackground,hidealllines=true]
\printcontents[chapters]{l}{1}{\colorbox{ptctitle}{%
  \parbox[t]{\dimexpr\textwidth-2\fboxsep\relax}{%
    \strut\color{white}\bfseries\sffamily\makebox[5em]{%
      Chapter~\thechapter\hfill}Contents}}\vskip5pt}
\end{mdframed}%
}