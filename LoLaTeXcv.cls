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
\RequirePackage[left=45px, top=60px, right=45px, bottom=50px]{geometry}
\RequirePackage{enumitem}  
\RequirePackage{environ}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{ifthen}
\RequirePackage{lmodern}
\RequirePackage{xcolor}

% GENERAL SETTINGS
\setlist[itemize]{leftmargin=*}
\setlist[enumerate]{leftmargin=*}

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

%% \lltxSection{title}
%% Section titles such as "Education" in order to different topics.
%%% Horizontal line.
\newcommand*\lltxRuleline[1]{
	\par\noindent\raisebox{.8ex}{\makebox[\linewidth]{\hrulefill\hspace{1ex}\raisebox{-0.5ex}{#1}\hspace{1ex}\hrulefill}}
}
%%% The command itself.
\newcommand{\lltxSection}[1]{
	\begin{center}
		\vspace{15px}
		\LARGE \lltxRuleline{\textit{#1}}
		\vspace{-30px}
	\end{center}
}

%% \lltxSubSection
\newcommand{\lltxSubSection}[1]{
	\vspace{1em}
	\noindent
	\large \textbf{#1} \normalsize \\
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
	\large \textbf{#1} \normalsize
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
\setlist[itemize, 1]{label=—}
\setlist[itemize, 2]{label=$ast$}
\NewEnviron{lltxItemize}[1]{
	\vspace{1em}
	\noindent
	\large \textbf{#1} \normalsize
	\begin{itemize}
		\BODY
	\end{itemize}
}

%% from https://github.com/treyhunner/resume/blob/master/resume.cls
%% #1: compagny name
%% #2: job title
%% #3: time period
%% #4: location
\NewEnviron{lltxProItemize}[4]{
	{#1} \hfill {{#3}, {#4}} \\
	{\textit{#2}}
	\begin{itemize}
		\BODY
	\end{itemize}
	\vspace{1em}
}

\iffalse
\lltxSubSection{Parcours professionnel}
\begin{lltxProItemize}{
		Sorbonne Université, UFR de mathématiques}{
		2020 (été)}{
		Développement d'un assistant de preuve pédagogique basé sur Lean}{
		Paris}
	\item Co-développement d'un assistant de preuve pédagogique basé sur \textit{Lean} (\url{https://leanprover.github.io/about/}), avec Frédéric Le Roux (IMJ-PRG) et Florian Dupeyron (étudiant en Master 1 d'informatique, Sorbonne Université).
	\item Le projet part du constat suivant : une grande partie des élèves de licence ne parvient pas à acquérir les bases syntaxiques de la démonstration, ce qui les empêche de progresser jusqu'aux preuves plus difficiles. Nous voulons proposer un logiciel d'entraînement à la démonstration en ajoutant deux couches à Lean : une couche sémantique dans laquelle l'élève indique le plus précisément possible les étapes de la démonstrations (p.-ex. on se donne deux groupes, puis un morphisme, puis un élément vérifiant telle propriété, etc) et une couche graphique rendant l'utilisation de Lean transparente.
	\item Le dépôt git du projet se situe à \url{https://github.com/FredericLeRoux/DEAduction} et nous utilisons Python car ce langage est le plus utilisé parmi les étudiants de Mathématiques, ce qui faciliterait leur éventuel investissement.
	\item Cette mission de développement est rémunérée par l'UFR de Mathématiques de Sorbonne Université.
\end{lltxProItemize}
\fi

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
% \urlstyle{same}
