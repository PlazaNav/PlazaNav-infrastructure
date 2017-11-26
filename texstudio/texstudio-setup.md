# TeXstudio setup
## Requirements
- Texlive-Installation
    - Je nach Distribution unterschiedlich, unter Fedora wird mindestens `texlive-scheme-medium` benötigt
- Zusätzliche LaTeX packages: `texlive-IEEEtran`, `texlive-collection-latexextra`
- Für das Syntax-Highlighting wird das Python-Package `pygments` benötigt
```
pip install pygments
```
- Als Schrift wird `Gentium Basic` verwendet. Sie kann hier heruntergeladen werden: <https://software.sil.org/gentium/download/>

## Settings
- Alle Optionen unter `Options -> Configure TeXStudio`
- `Build` -> `Default Compiler: XeLaTeX`
- `Commands` -> Unter `XeLateX` den Parameter `-shell-escape` hinzufügen (wird für Syntax-Highlighting benötigt) und ganz am Schluss `|makeglossaries %` anhängen (wird für das Glossar benötigt)
- `Editor` -> Identation Mode: `Keep Identation`
- `Language Checking` -> Default Language: `de_CH`
- Falls nicht vorhanden, manuell herunterladen: <https://extensions.libreoffice.org/extensions/german-de-ch-frami-dictionaries>
    - `.oxt`-File entpacken und die beiden Files `.dic` und `.aff` in das Verzeichnis `/usr/share/myspell` kopieren
