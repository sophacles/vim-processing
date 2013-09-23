# Vim processing

This is an extension of [vim script #2115](http://www.vim.org/scripts/script.php?script_id=2115). It started simply as an easy git repo to bundle and use with pathogen, but has grown as I use Processing more.

### I have made two sets of modifications so far:

1. Documentation is now browsable locally or on the web. If you set the
variable *processing_doc_style* to “local” it will use a local copy of the Processing docs (and requires you to set the variable *processing_doc_path* to point to the root of the documents). If you set *processing_doc_style* to “web” it will point your browser at the Processing site when you use attempt to use the documentation hookup. (normal mode K)

2. Sketches can now be run directly from Vim using the `:make` command.

Sketches are run via the `processing-java` command. This tool is used to run sketches outside of the Processing editor, and is supplied with Processing itself. Make sure `processing-java` is in your `PATH` before trying to run it from vim-processing.

Folding can be enabled by defining "processing_fold" 

	let processing_fold = 1
