
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


if has("python") && exists("processing_doc_style")

function! ProcessingDoc()
python << ENDPY
import vim
import re
import webbrowser
from os import path

def launchDocFile(filename):
    docfile = path.join(basepath, filename)
    if path.exists(docfile) and path.isfile(docfile):
        webbrowser.open(docfile)
        return True
    return False

def launchDocWeb(filename):
	docfile = "http://processing.org/reference/"
	webbrowser.open(docfile+filename)
	return True

if vim.eval("g:processing_doc_style") == "local":
	basepath = path.abspath(vim.eval("g:processing_doc_path"))
	launchDoc = launchDocFile
else:
	launchDoc = launchDocWeb

(row, col) = vim.current.window.cursor
line = vim.current.line

if re.match(r"\w+\s*\(", line[col:]):
    fun = True
else:
    fun = False
word = vim.eval('expand("<cword>")')


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

if has("macunix")
function! RunProcessing()
	let sketch = expand("%:h:t")
	"shell osascript -e 'set sname to "sketch_aug15a"' -e 'tell application "Processing" to activate' -e 'tell application "System Events" to tell process "Processing"' -e 'repeat' -e 'set t to title of every window' -e 'set ta to item 1 of t' -e 'if ta contains sname then' -e 'keystroke "r" using command down' -e 'exit repeat' -e 'else' -e 'keystroke "`" using command down' -e 'end if' -e 'end repeat' -e 'end tell'

	let input =  ["set sname to \"" . expand("%:p:h:t") . "\""]
	let input += ["tell application \"Processing\" to activate" ]
	let input += ["tell application \"System Events\" to tell process \"Processing\""]
	let input += ["set l to title of every window"]
	let input += ["set qt to true"]
	let input += ["repeat with name in l"]
	let input += ["if name contains sname then"]
	let input += ["set qt to false"]
	let input += ["end if"]
	let input += ["end repeat"]
	let input += ["if qt is true"]
	let input += ["return"]
	let input += ["end if"]
	let input += ["repeat"]
	let input += ["set t to title of every window"]
	let input += ["set ta to item 1 of t"]
	let input += ["if ta contains sname then"]
	let input += ["keystroke \"r\" using {command down}"]
	let input += ["exit repeat"]
	let input += ["else"]
	let input += ["keystroke \"`\" using command down"]
	let input += ["end if"]
	let input += ["end repeat"]
	let input += ["end tell"]
	let myargs = join(input, "\n") . "\n"
    call system("osascript", myargs)
endfunction "RunProcessing
map <F5> :call RunProcessing()<CR>
endif "has("macunix")

endif

