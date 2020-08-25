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
\RequirePackage[left=40px, top=70px, right=40px, bottom=70px]{geometry}
\RequirePackage{enumitem}  
\RequirePackage{environ}
\RequirePackage{eqparbox}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{lmodern}
\RequirePackage{xcolor}
\RequirePackage{xifthen}

% GENERAL SETTINGS
%% no indent on lists, numerate, description
\setlist[itemize]{leftmargin=*}
\setlist[enumerate]{leftmargin=*}
\setlist[description]{leftmargin=*}
%% Adjust the spacing of two consecutive dots in \dotfill.
\makeatletter
	\newcommand \lltxdotfill {\leavevmode \cleaders \hb@xt@ 1em{\hss .\hss }\hfill \kern \z@}
\makeatother
%% No page numbers.
\pagenumbering{gobble}
% No indentation.
\setlength\parindent{0pt}
%% lmodern for \url and not the ugly font.
%% https://tex.stackexchange.com/questions/261434/changing-url-font
%% \urlstyle{same}

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

%% \lltxSection{Section name}
%% Section names such as "Education" in order to different topics.
%%% Horizontal line.
\newcommand*\lltxRuleline[1]{
	\par\noindent\raisebox{.8ex}{\makebox[\linewidth]{\hrulefill\hspace{1ex}\raisebox{-0.5ex}{#1}\hspace{1ex}\hrulefill}}
}
%%% The command itself.
\newcommand{\lltxSection}[1]{
	\begin{center}
		\vspace{15px}
		\LARGE \lltxRuleline{\textit{#1}} \normalsize
		\vspace{-3em}
	\end{center}
}

%% \lltxSubSection
\newcommand{\lltxSubSection}[1]{
	\vspace{1.5em}
	\noindent \textbf{#1}
}

%% \begin{lltxDescription}{SectionTitle}
%%		\item[ItemTitle] ItemDescription 
%% \end{lltxDescription}
%% Classical history section, suited for education, for exemple.
%% This length is determined by the longest ItemTitle.
%% https://tex.stackexchange.com/questions/130097/automatically-set-description-list-labelwidth-based-on-widest-label.
\newlist{lltxDescription}{description}{1}
\setlist[lltxDescription]{
    format = \normalfont\lltxDescriptionlabel,
    labelwidth = 0.3cm+\eqboxwidth{listlabel@\EnumitemId},
    leftmargin = !,
}
\newcommand\lltxDescriptionlabel[2][l]{\eqmakebox[listlabel@\EnumitemId][#1]{#2}}

%% \begin{lltxItemize}{SectionTitle}
%%		\item
%% \end{lltxItemize}
%% It's just an itemize with a Title.
%%% change the symbols of first and second levels of itemize
\NewEnviron{lltxItemize}{
	\begin{itemize}
		\BODY
	\end{itemize}
}

%% \begin{lltxJob}[Job title]{Compagny}{Time period}{Location}
%%		\item description
%%		\item some other description
%% \end{lltxJob}
%% inspired from https://github.com/treyhunner/resume/blob/master/resume.cls
%% #1: job title, optional, between []
%% #2: compagny
%% #3: time period
%% #4: location
\NewEnviron{lltxJob}[4][]{
	% leave an empty line for the linejump, yup it is ugly

	\vspace{4px}
	#2 \lltxdotfill #3 $\cdot$#4
	\ifthenelse{\isempty{#1}}{ % if #1 is empty, then 
	}
		% do nothing
	{% else, then
		\newline \textit{#1}
	}
	\begin{itemize}[leftmargin=!, label=$\cdot$]
		\BODY
	\end{itemize}
}

%% \NTS{Note to self}
%% Display bold red notes directly in the document, like "Add this" or "Change that".
\newcommand{\NTS}[1]{\textcolor{red}{\textbf{#1}}}
