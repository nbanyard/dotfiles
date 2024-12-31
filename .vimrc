unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

set mouse=nv
map

" ALE mappings
map K :ALEHover<cr>
map gA :ALECodeAction<cr>
map gd :ALEGoToDefinition<cr>
map gi :ALEGoToImplementation<cr>
map gy :ALEGoToTypeDefinition<cr>
map gr :ALEFindReferences -relative<cr>
map gR :ALERepeatSelection<cr>
map <leader>rn :ALERename<cr>
map <leader>RN :ALEFileRename<cr>
map <leader>or :ALEImport<cr>
map ]g :ALENext<cr>
map [g :ALEPrevious<cr>

map gn :NERDTree<cr>

"syntax enable
"filetype plugin indent on

if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    "nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    "nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    let g:lsp_diagnostics_enabled = 1
    let g:lsp_diagnostics_echo_cursor = 1
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


let g:ale_fixers = {
\ 'rust': [
\     'rustfmt',
\ ],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1