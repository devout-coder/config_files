let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +50 ~/.config/nvim/lua/plugins/init.lua
badd +29 ~/.config/nvim/init.lua
badd +137 ~/.config/nvim/lua/core/mappings.lua
badd +21 ~/.config/nvim/lua/custom/plugins.lua
badd +16 ~/.config/nvim/lua/custom/init.lua
badd +43 ~/.config/nvim/lua/custom/mappings.lua
badd +9 ~/.config/nvim/lua/custom/configs/null-ls.lua
badd +6 ~/.config/nvim/lua/custom/configs/lspconfig.lua
badd +9 ~/.config/nvim/lua/plugins/configs/lspconfig.lua
badd +9 ~/.config/nvim/.gitignore
badd +47 ~/.config/nvim/lua/pde/lua.lua
badd +41 ~/.config/nvim/lua/pde/python.lua
badd +158 ~/.config/nvim/lua/config/lsp/init.lua
badd +3 ~/.config/nvim/lua/pde/go.lua
badd +23 ~/.config/nvim/lua/pde/cpp.lua
badd +6 ~/.config/nvim/lua/pde/java.lua
badd +3 ~/.config/nvim/lua/pde/json.lua
badd +11 ~/.config/nvim/lua/pde/typescript.lua
badd +1 ~/.config/nvim/lua/custom/chadrc.lua
argglobal
%argdel
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
