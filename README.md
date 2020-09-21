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
% do not forget Babel

\begin{document}

\lltxPersonalInfo{
	Your Name}{
	Stuff on the left}{
	Stuff in the center}{
	Stuff on the right}

% content goes here

\end{document}
```

![`lltxPersonalInfo` displayed](Images/lltxPersonalInfo.png)

You may now use the other commands and environments! Each command or environment begins with the prefix `lltx` and is explained here. See [Example.tex](Example.tex) and [Example.pdf](Example.pdf) for usage examples.

### Hierarchy of a LoLaTeXcv curriculum vitae

There are two level of hierarchy : `lltxSection` and `lltxSubSection`, respectively equivalent to `section` and `subsection`. `lltxSection` should be used to organize a curriculum vitae into thematic parts (e.g. Career) and `lltxSubSection` should be used to devide a `lltsSection` into individual components (e.g. `Employment history` and `Education`).

#### A section with `lltxSection`

```latex
\lltxSection{Section title}
```

![A simple example of `lltxSection`](Images/lltxSection.png)

#### A subsection with `lltxSubSection`

```latex
\lltxSubSection{SubSection title}
```

![A simple example of `lltxSubSection`](Images/lltxSubSection.png)

### LoLaTeXcv environments

Each and everyone of these environments should be preceded by a title made with `lltxSubSection`.

#### An employment history with `lltxJob`

```latex
\begin{lltxJob}[Job title]{
		Compagny}{
		Dates}{
		Place}
	\item Descriptive item.
	% more descriptive items
\end{lltxJob}
```

The `lltxJob` environment is best suited for education and employment history. Item descriptions are horizontally aligned and anything written after `\lltxdotfill` is pushed to the end of the line. Here is an example.

!['Education history with `lltxJob`](Images/lltxJob1.png)

This environment is very adaptive and can be used without `\lltxdotfill`, for example to organize your content as a list of subsections. Here is an example.

!['Computer skills with `lltxJob`](Images/lltxJob2.png)

#### An itemize with `lltxItemize`

```latex
\begin{lltxItemize}
	\item Descriptive item.
	% more descriptive items
\end{lltxItemize}
```

Use the `lltxItemize` environment instead of the standard `itemize` environment. Here is an example.

![A simple example of `lltxItemize`](Images/lltxItemize.png)

#### A description with `lltxDescription`

```latex
\begin{lltxDescription}
	\item[Item title] Descriptive item. \lltxdotfill Additional info
	% More descriptive items.
	% or 
	\item[Item title] Descriptive item. % and no \lltxdotfill and Additional info
\end{lltxDescription}
```

Use the `lltxDescription` environment instead of the standard `description` environment. Here is an example.

![A simple example of `lltxDescription`](Images/lltxDescription.png)

### Notes

- `\url` commands are displayed in the same font as the document, not in the ~~ugly~~ traditional monospaced font.
- I created `\lltxdotfill` because the space between consecutive dots in `\dotfill` was too short. You can adjust the space used by `lltxdotfill` by changing it directly in the class file [LoLaTeX.cls](LoLaTeXcv.cls). If you do not like dots, you can use `\hfill` instead of `lltxdotfill` (you will get a blank space), or any other "filling" command. 

### Warnings

- If you need more sophisticated sections, such as a complex employment history, I suggest you give [Trey Hunner's *curriculum vitae* class](https://github.com/treyhunner/resume) a try. 
- If you use `lltxDescription`, you need to compile twice.

## Authors
- Antoine Hugounet : myself, creator of this repo.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgements
- [Florian Dupeyron](https://github.com/fdmysterious) for his numerous advices and the gigantic quantity of time he spent helping me on various projects, including this one.
- Lola Lanier for helping me correcting many typos and giving her wonderful name to this template.
- [thiswillbeyourgithub](https://github.com/thiswillbeyourgithub) for his ~~shity~~ funny ideas for [Example.pdf](Example.pdf).
- John Frusciante for his [voice](https://youtu.be/bFLs9mi6TK0?t=215) and [music](https://www.youtube.com/watch?v=-G2n6UqOWIo).
