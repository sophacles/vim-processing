# Vim processing

Development version of [vim script #2115](http://www.vim.org/scripts/script.php?script_id=2115). Originally authored by Szabolcs Horvát, and extended by Erich Heine and others (see below for a full list), this plugin exists to allow vim to replace the Processing IDE to develop sketches.

### Features

1. Syntax Highlighting for Processing language: will properly highlight sketches, based on the processing keywords.txt file. This includes processing functions and Java types and keywords as well.

2. Documentation lookup - pressing `K` in when over a keyword, type or funciton defined by processing will open a browser to the relevant documentation. (currently requires python)

3. Integrates with Vim's `:make` command. Simply typeing make will compile and run a sketch, and open the quickfix window if there are errors detected.

4. Folding can be enabled by defining "processing_fold"
    let processing_fold = 1

### Installing

Use your favorite plugin manager, or download processing.zip from vimscripts and unzip it in ~/.vim/

### Contributors
The full list of contributors to this project:

*  Szabolcs Horvát (@szhorvat)
*  Erich Heine (@sophacles)
*  Guy John (@rumblesan)
*  Richard Gray (@vortura)
*  Crazy Master (@crazymaster)
*  Vítor Galvão (@vitorgalvao)
