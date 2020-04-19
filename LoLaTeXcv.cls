% LoLaTeXcv.cls
% Antoine Hugounet
% https://github.com/kryzar/LoLaTeXcv
% https://www.overleaf.com/learn/latex/Writing_your_own_class
% https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages#Installing_a_package

% PRELIMINARY DECLARATIONS
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LoLaTeXcv}[2020/03/13 LoLaTeXcv]
\LoadClass[11pt, a4paper, oneside]{report}

% PACKAGES
\RequirePackage[left=35px, top=60px, right=35px, bottom=50px]{geometry}
\RequirePackage{enumitem}  
\RequirePackage{environ}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{lmodern}
\RequirePackage{xcolor}

% ENVIRONMENTS AND COMMANDS
% All commands begin with lltx and are followed by a cap. letter.

%% \lltxPersonalInfo{YourName}{YourAdress}{YourPosition}{Stuff}
%% To be used at the beginning of the resume to indicate your name, adress, 
%% position (e.g. Assistant to the regional manager) and other stuff like 
%% your phone number, email adress, etc.
\newcommand{\lltxPersonalInfo}[4]{
	\begin{center}
		\vspace{20px}
		\Huge \textsc{#1}
		\vspace{20px}

		\normalsize
		\begin{minipage}[t]{0.3\textwidth}
			\begin{center}
				#2
			\end{center}
		\end{minipage}
		\begin{minipage}[t]{0.35\textwidth}
			\begin{center}
				#3
			\end{center}
		\end{minipage}
		\begin{minipage}[t]{0.3\textwidth}
			\begin{center}
				#4
			\end{center}
		\end{minipage}
	\end{center}
}

%% \lltxTitle{title}
%% Section titles such as "Education" in order to different topics.
%%% Horizontal line.
\newcommand*\lltxRuleline[1]{
	\par\noindent\raisebox{.8ex}{\makebox[\linewidth]{\hrulefill\hspace{1ex}\raisebox{-0.5ex}{#1}\hspace{1ex}\hrulefill}}
}
%%% The command itself.
\newcommand{\lltxTitle}[1]{
	\begin{center}
		\vspace{15px}
		\LARGE \lltxRuleline{\textit{#1}}
		\vspace{-30px}
	\end{center}
}

%% \begin{lltxHistory}{SectionTitle}
%%		\item[ItemTitle] ItemDescription 
%% \end{lltxHistory}
%% Classical history section, suited for education, for exemple.
%% The hard part was setting a constant length of the ItemTitle part. 
%% This length is determined by the longest ItemTitle.
%% https://tex.stackexchange.com/questions/130097/automatically-set-description-list-labelwidth-based-on-widest-label.
%%% First, there is magic to get the longest ItemTitle.
\newlength\lltxWidest
\makeatletter
%%% Somehow newenvrionment does not work.
\NewEnviron{lltxHistory}[1]{
	\vbox{
		\global\setlength\lltxWidest{0pt}
		\def\item[##1]{
			\settowidth\@tempdima{\textbf{##1}}
			\ifdim\@tempdima>\lltxWidest\global\setlength\lltxWidest{\@tempdima}\fi
		}
		\setbox0=\hbox{\BODY}
	}
	\noindent
	\textbf{#1}
	%%% After the magic, comes the assembly of the command.
	%%% See the enumitem package.
	\begin{description}[
		font = \normalfont,
		labelindent = 0px,
		labelwidth = \lltxWidest,
		%%% 10px space between ItemTitle and ItemDescription
		%%% Can be changed at will.
		labelsep = 10px]
	\BODY
	\end{description}
}
\makeatother

%% \begin{lltxItemize}{SectionTitle}
%%		\item
%% \end{lltxItemize}
%% It's just an itemize with a Title.
%%% change the symbols of first and second levels of itemize
\setlist[itemize, 1]{label={$\bullet$}}
\setlist[itemize, 2]{label={$\star$}}
\NewEnviron{lltxItemize}[1]{
	\vspace{1em}
	\noindent
	\textbf{#1}
	\begin{itemize}[
		leftmargin=*]
		\BODY
	\end{itemize}
}

%% \NTS{Note to self}
%% Display bold red notes directly in the document, like "Add this" or "Change that".
\newcommand{\NTS}[1]{\textcolor{red}{\textbf{#1}}}

% COSMETICS

%% Adjust the spacing of two consecutive dots in \dotfill.
\makeatletter
	\newcommand \lltxdotfill {\leavevmode \cleaders \hb@xt@ 1em{\hss .\hss }\hfill \kern \z@}
\makeatother

%% No page numbers.
\pagenumbering{gobble}

% No indentation.
\setlength\parindent{0pt}

% lmodern for \url and not the ugly font.
% https://tex.stackexchange.com/questions/261434/changing-url-font
\urlstyle{same}
