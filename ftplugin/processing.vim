
" Only do this when not done yet for this buffer
if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

" Make sure the continuation lines below do not cause problems in
" compatibility mode.
let s:save_cpo = &cpo
set cpo-=C

" You may want to comment these
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

if has("folding") && exists("g:processing_fold")
  setlocal fdm=syntax
endif

setlocal cindent
setlocal cinkeys-=0#
setlocal formatoptions-=t formatoptions+=croql
setlocal suffixesadd=.pde

let b:undo_ftplugin = "set cin< cink< fo< sua< et< sw< ts<"

if !exists("g:processing_doc_style")
	let g:processing_doc_style = "web"
endif
" TODO: have a sane default doc path
if !exists("g:processing_doc_path")
	let g:processing_doc_style = "web"
endif

if g:processing_doc_style == 'web'
	let g:processing_doc_path="http://processing.org/reference"
endif

" Note - other functions for processing#docopen can be put here
" for example, we could put open-browser in here
if has("python")
	function! processing#docopen(docuri)
		python << ENDPY
import webbrowser
import vim
webbrowser.open(vim.eval("a:docuri"))
ENDPY
	endfunction
endif " deterime doc style

if exists("*processing#docopen")
	function! ProcessingDoc()
		let list_of_no_suffix_syntypes = [
			\ "processingType",
			\ "processingVariable",
			\ "processingConstant",
			\ "javaConditional",
			\ "javaRepeat",
			\ "javaBoolean",
			\ "javaConstant",
			\ "javaTypedef",
			\ "javaOperator",
			\ "javaType",
			\ "javaType",
			\ "javaStatement"]
		let word = expand("<cword>")
		let syntype = synIDattr(synID(line('.'), col('.'), 1), "name")
		if syntype == "processingFunction"
			let ending = "_.html"
		elseif index(list_of_no_suffix_syntypes,syntype) >= 0
			if word == "color"
				let ending = "_datatype.html"
			else
				let ending = ".html"
			endif " word == color
		endif
		if exists("ending")
			call processing#docopen(g:processing_doc_path ."/" . word . ending)
		else
			echo "No known documentation for " . word
		endif
	endfunction "ProcessingDoc

	nnoremap <silent> <buffer> <Plug>(processing-keyword) :<C-u>call ProcessingDoc()<CR>
	vnoremap <silent> <buffer> <Plug>(processing-keyword) :<C-u>call ProcessingDoc()<CR>
	if !exists('g:processing_no_default_mappings')
		silent! nmap <silent> <buffer> K <Plug>(processing-keyword)
		silent! vmap <silent> <buffer> K <Plug>(processing-keyword)
	endif
endif "processing#docopen



" AppleScript for running sketches on OS X pre Processing 2.0b5
let s:runner = expand('<sfile>:p:h').'/../bin/runPSketch.scpt'

if !exists("g:use_processing_applescript")
	compiler processing
endif

" RunProcessing - Run the current sketch in Processing
function! RunProcessing()

	let sketch_name =  expand("%:p:h:t")

    if has("macunix") && exists("g:use_processing_applescript")
        let command =  "!osascript ".s:runner." ".sketch_name
        silent execute command
    else
		make
    endif " has("macunix")...

endfunction "RunProcessing

nnoremap <silent> <buffer> <Plug>(processing-run) :<C-u>call RunProcessing()<CR>
if !exists('g:processing_no_default_mappings')
	silent! nmap <silent> <buffer> <F5> <Plug>(processing-run)
endif
command! RunProcessing call RunProcessing()

" Restore the saved compatibility options.
let &cpo = s:save_cpo
unlet s:save_cpo
