local M = {}

function M.config()
    local result = vim.cmd([[
    """""""vimtex"""""""

    let g:tex_flavor='latex'
    let g:vimtex_view_general_viewer  = 'skim'
    let g:vimtex_view_general_options = '-r @line @pdf @tex'
    let g:vimtex_view_method='skim'
    let g:vimtex_fold_enabled=1
    let g:vimtex_quickfix_mode=1
    set conceallevel=2
    let g:tex_conceal='abdmg'
    "sudo tlmgr install latexmk --repository http://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet
    let g:vimtex_syntax_conceal = {
	      \ 'accents': 1,
	      \ 'cites': 1,
	      \ 'fancy': 1,
	      \ 'greek': 1,
	      \ 'math_bounds': 1,
	      \ 'math_delimiters': 1,
	      \ 'math_fracs': 1,
	      \ 'math_super_sub': 1,
	      \ 'math_symbols': 1,
	      \ 'sections': 1,
	      \ 'styles': 1,
	      \}

    let g:vimtex_compiler_latexmk = {
		\ 'build_dir' : {-> 'out'},
		\ 'executable' : 'latexmk',
		\ 'options' : [
		\   '-xelatex',
		\   '-file-line-error',
		\   '-synctex=1',
		\   '-interaction=nonstopmode',
		\ ],
		\}
    "let g:vimtex_toc_config = {
    "            \ 'name' : 'TOC',
    "            \ 'layers' : ['content', 'todo', 'include'],
    "            \ 'split_width' : 30,
    "            \ 'todo_sorted' : 0,
    "            \ 'show_help' : 1,
    "            \ 'show_numbers' : 1,
    "            \}

    augroup vimtex_config
      autocmd!
      autocmd User VimtexEventQuit call vimtex#compiler#clean(0)
    augroup END
    augroup VimTeX
      autocmd!
      autocmd BufWritePost *.tex call vimtex#toc#refresh()
    augroup END

    """""""AsynRun""""""
    let g:asyncrun_status = "stopped" 
    "let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])


    noremap <leader>t :call Test()<cr>
    function Test()
	exe "w"
	if &filetype=='cpp'
	    exe "AsyncRun -cwd=$(VIM_FILEDIR) -mode=term -pos=bottom cf test %"
	endif
    endfunction

    noremap <leader>s :call Submit()<cr>
    function Submit()
	exe "w"
	if &filetype=='cpp'
	    exe "AsyncRun -cwd=$(VIM_FILEDIR) -mode=term -pos=bottom cf submit -f % %< "
	endif
    endfunction

    noremap <leader>l :call Run()<cr>
    function Run()
	exe "w"
	if &filetype=='md'
	    exe "MarkdownPreview"
	elseif &filetype=='python'
	    exe "AsyncRun -cwd=$(VIM_FILEDIR) -mode=term -pos=bottom python3 \"$(VIM_FILEPATH)\""
	    "exe "AsyncRun -cwd=$(VIM_FILEDIR) -mode=term -pos=bottom python predict.py"
	elseif &filetype=='sh'
	    exe "AsyncRun -cwd=$(VIM_FILEDIR) -mode=term -pos=bottom bash \"$(VIM_FILEPATH)\""
	elseif &filetype=='c'
	    exe "AsyncRun  gcc \"$(VIM_FILEPATH)\" -o \"$(VIM_FILEDIR)/$(VIM_FILENOEXT)\""
	    while g:asyncrun_status=='running'
		sleep 100m
	    endwhile
	    if g:asyncrun_status!='failure'
		exe "copen"
	    else 
		exe "AsyncRun -mode=term -pos=bottom $(VIM_PATHNOEXT)"
	    endif
	elseif &filetype=='cpp'
	    "exe "AsyncRun -mode=0  g++ -O3 \"$(VIM_FILEPATH)\" -o \"$(VIM_FILEDIR)/$(VIM_FILENOEXT)\" -lpthread"
	    exe "AsyncRun -mode=0  g++ -O3 $(pkgconfig --cflags --libs opencv) -std=c++11 \"$(VIM_FILEPATH)\" -o \"$(VIM_FILEDIR)/$(VIM_FILENOEXT)\" -lpthread"
	    while g:asyncrun_status=='running'
		sleep 100m
	    endwhile
	    if g:asyncrun_status=='failure'
		exe "copen"
	    else 
		exe "AsyncRun -mode=term -pos=bottom $(VIM_PATHNOEXT)"
	    endif
	endif
    endfunction
    ]])
end 
return M
