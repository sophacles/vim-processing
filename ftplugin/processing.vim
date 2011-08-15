
" Only do this when not done yet for this buffer
if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

" You may want to comment these
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2


setlocal cindent
setlocal cinkeys-=0#
setlocal formatoptions-=t formatoptions+=croql
setlocal suffixesadd=.pde

let b:undo_ftplugin = "set cin< cink< fo< sua< et< sw< ts<"


if has("python") && exists("processing_doc_path")

function! ProcessingDoc()
python << ENDPY
import vim
import re
import webbrowser
from os import path

basepath = path.abspath(vim.eval("g:processing_doc_path"))
(row, col) = vim.current.window.cursor
line = vim.current.line
if re.match(r"\w+\s*\(", line[col:]):
    fun = True
else:
    fun = False
word = vim.eval('expand("<cword>")')

def launchDoc(filename):
    docfile = path.join(basepath, filename)
    if path.exists(docfile) and path.isfile(docfile):
        webbrowser.open(docfile)
        return True
    return False

if word:
    if fun:
        success = launchDoc(word + "_.html") or launchDoc(word + ".html")
    else:
        success = launchDoc(word + ".html") or launchDoc(word + "_.html")
    if not success:
        print "Identifier", '"' + word + '"', "not found in the documentation."

ENDPY
endfunction

nnoremap <silent> <buffer> K :call ProcessingDoc()<CR>

endif
