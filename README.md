# LoLaTeXcv, a curriculum vitae template for LaTeX

*LoLaTeXcv* is curriculum vitae template for LaTeX. It comes as a single file class, and might be great for you if you like organizing your curriculum vitae using lists.

[![](Images/Overview.png)](Example.pdf)

## Installation
### The easy way

1. Download the file [LoLaTeXcv.cls](LoLaTeXcv.cls) and put it in the same directory as your LaTeX curriculum vitae.

### The smart way
If you have multiple curricula vitae using this class, it can be very painful to have a copy of [LoLaTeXcv.cls](LoLaTeXcv.cls) in each directory. The best solution is to have a *unique* copy of this file, in the right place, that is in `TeXInstallationDirectory/tex/latex/base/LoLaTeXcv/`, as dictated by the mighty [*LaTeX Wikibook*](https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages#Installing_a_package). Now please, follow these steps.

1. Locate your LaTeX installation directory.
	- If you are using MacTex on macOS, it is `Users/USERNAME/Library/texmf/` ;
	- If you are on Unix-type systems, it is `~/texmf/` ;
	- If you are on Windows, run `kpsewhich -var-value=TEXMFHOME$` in a terminal, and the directory is displayed.
2. If they do not exist, create the sub-directories `tex/latex/base/` in this directory.
3. Open a terminal session in this directory and run `git clone https://github.com/kryzar/LoLaTeXcv`. 

## Usage
### Getting started

Once you successfully installed the class, open your LaTeX curriculum vitae, and use the `LoLaTeXcv` document class. You must manage encoding and language as well. You do not need any other package. You may afterwards begin the document. This is what your file should look like.
```latex
\documentclass{LoLaTeXcv}
\includepackage[T1]{fontenc}
\includepackage[utf8]{inputenc}
% maybe a language package e.g. \usepackage[french]{babel}

\begin{document}


\end{document}
```

To display your name and personal information (your address, phone number, email address or anything else), use the `lltxPersonalInfo`.
- This command should be used *right after* `\begin{document}`.
- This command should be used once, and only once.
- The first argument of `lltwPersonalInfo` *must* be your name ; the three remaining arguments are displayed as followed.

```latex
\documentclass{LoLaTeXcv}
\includepackage[T1]{fontenc}
\includepackage[utf8]{inputenc}

\begin{document}

\lltxPersonalInfo{
	Your Name}{
	Stuff on the left}{
	Stuff in the center}{
	Stuff on the right}

% content goes here

\end{document}
```

![`lltxPersonalInfo` displayed](Images/PersonalInfo.png)

You may now use the other commands and environments! Each command or environment begins with the prefix `lltx` and is explained here. See my own CV ([code](Example.tex) and [pdf](Example.pdf)) for a real life example.

### lltxHistory
```latex
\begin{lltxHistory}{Section title}
	\item[Item title] item description \lltxdotfill Additional info
	% more items
	% or 
	\item[Item title] item description % and no \lltxdotfill and Additional info
\end{lltxHistory}
```

The `lltwHistory` environment is best suited for education and employment history. Item descriptions are horizontally aligned and anything written after `\lltxdotfill` is pushed to the end of the line. Here is an example from my own curriculum vitae.

```latex
\begin{lltxHistory}{Cursus}
	\item[2019-2020] M1 de mathématiques \lltxdotfill Sorbonne Université
	\item[2018-2019] L3 de mathématiques, mention bien \lltxdotfill Sorbonne Université
	\item[2017] Erasmus+ (premier semestre) \lltxdotfill Université d'Oslo (Norvège)
	\item[2015-2018] licence de mécanique, mention bien \lltxdotfill Sorbonne Université
	\item[2015-2018] licence de musicologie, mention assez bien \lltxdotfill Sorbonne Université
	\item[2015] Bac S, spécialité mathématiques, mention très bien \lltxdotfill Lycée Rocroy St-Vincent de Paul
\end{lltxHistory}
```
!['Education history with `lltxHistory`](Images/EducationHistory.png)

This environment is very adaptive and can be used without `\lltxdotfill`, for example to organize your content as a list of subsections. This is what I do for computer skills.

```latex
\begin{lltxHistory}{Informatique}
	\item[Programmation]C++, C, Python \& Numpy, Sage, Pari/GP, Octave/Matlab, HTML/CSS/JavaScript
	\item[Outils]Git, neovim, \LaTeX, Bash/zsh, Anki, Gnuplot, Pandoc, XCode, ffmpeg
	\item[Systèmes]GNU/Linux (bases, terminal), macOS (usage avancé), Windows (bases)
\end{lltxHistory}
```

!['Computer skills with `lltxHistory`](Images/ComputerSkills.png)

### lltxItemize

```latex
\begin{lltxItemize}{Section title}
	\item item description
	% more items
\end{lltxItemize}
```

The `lltxItemize`environment is a modified `itemize` environment. It has a title, uses bullets as symbols and has no indentation. As an example, here is the list of mathematics books I read outside of my degrees.

```latex
\begin{lltxItemize}{Lectures assidues}
	\item{\textit{Algèbre et théories galoisiennes}, R. et A. Douady : Théorème de Zorn, Catégories et foncteurs}
	\item{\textit{Algèbre : le grand combat}, G. Berhuy : théorie de Galois}
	\item{\textit{Carmichael ideals in number rings}, G. A. Steele, Journal of Number Theory : en entier}
	\item{\textit{Cours d'algèbre}, M. Demazure : Corps finis}
	\item{Challenges https://www.mathraining.be : niveau \textit{Compétent}}
	\item{\textit{Cryptography I}, D. Boneh, cours au MIT : Stream ciphers, Block ciphers}
	\item{\textit{Raisonnements divins}, M. Aigner, M. G. Ziegler : Théorie des nombres}
\end{lltxItemize}
```

![A simple example of `lltxItemize`](Images/lltxItemize.png)

### lltxTitle

```latex
\lltxTitle{Big section title}
```

The `lltxTitle` command<sup>This is where the fun begins.</sup> was created to organize a curriculum vitae into thematic parts. This is what I came up with in my curriculum vitae : *Learning*, *Involvement* and *Miscellanea*. It is optional and should be used carefully. Use it because it is relevant, not because it is sexy. This is how it is displayed.

![A simple example of `lltxTitle`](Images/lltxTitle.png)

See my CV to view the result "in the text".

### Notes

- `\url` commands are displayed in the same font as the document, not in the ~~ugly~~ traditional monospaced font.
- I created `\lltxdotfill` because the space between consecutive dots in `\dotfill` was too short. You can adjust the space used by `lltxdotfill` by changing it directly in the class file [LoLaTeX.cls](LoLaTeXcv.cls). If you do not like dots, you can use `\hfill` instead of `lltxdotfill` (you will get a blank space), or any other "filling" command. 

### Warnings

- If you need more sophisticated sections, such as a complex employment history, I suggest you give [Trey Hunner's *curriculum vitae* class](https://github.com/treyhunner/resume) a try. 
- You should avoid jumping lines in `lltxHistory` — the alignments will be mediocre at best. If you find a better implementation of `lltxHistory`, that is one that would allow line jumps in the *item description* while still having the *Additional info* on the top right of the item, please contact me or make a pull request so you can contribute.

## Authors
- Antoine Hugounet : myself, creator of this repo.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgements
- [Florian Dupeyron](https://github.com/fdmysterious) for his numerous advices and the gigantic quantity of time he spent helping me on various projects, including this one.
- Lola Lanier for helping me correcting many typos and giving her wonderful name to this template.
- John Frusciante for his [voice](https://youtu.be/bFLs9mi6TK0?t=215) and [music](https://www.youtube.com/watch?v=-G2n6UqOWIo).
