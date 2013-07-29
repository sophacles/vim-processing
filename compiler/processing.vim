if exists("current_compiler")
  finish
endif
let current_compiler = "processing"

if exists(":CompilerSet") != 2      " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let sketch_name =  expand("%:p:h:t")
let sketch_path =  expand("%:p:h")

if has("win32") || has("win64")
    let output_dir = "\"" . expand("$TEMP") . "\\vim-processing\\" . sketch_name . "\""
else
    let output_dir = "/tmp/vim-processing/" . sketch_name
endif " has("win32") ...

execute "CompilerSet makeprg=". escape("processing-java --sketch=\"" . sketch_path . "\" --output=\"". output_dir . "\" --force --run", " \"")

CompilerSet errorformat=%f:%l:%c:%*\\d:%*\\d:\ %m,%-G%.%#

