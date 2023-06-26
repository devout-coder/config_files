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
badd +169 ~/.config/nvim/lua/plugins/init.lua
badd +19 ~/.config/nvim/init.lua
badd +128 ~/.config/nvim/lua/core/mappings.lua
badd +74 ~/.config/nvim/lua/custom/plugins.lua
badd +1 ~/.config/nvim/lua/custom/init.lua
badd +20 ~/.config/nvim/lua/custom/mappings.lua
badd +46 ~/.config/nvim/lua/custom/configs/null-ls.lua
badd +86 ~/.config/nvim/lua/custom/configs/lspconfig.lua
badd +22 ~/.config/nvim/lua/plugins/configs/lspconfig.lua
badd +9 ~/.config/nvim/.gitignore
badd +15 ~/.config/nvim/lua/pde/lua.lua
badd +19 ~/.config/nvim/lua/pde/python.lua
badd +158 ~/.config/nvim/lua/config/lsp/init.lua
badd +52 ~/.config/nvim/lua/pde/go.lua
badd +77 ~/.config/nvim/lua/pde/cpp.lua
badd +6 ~/.config/nvim/lua/pde/java.lua
badd +3 ~/.config/nvim/lua/pde/json.lua
badd +11 ~/.config/nvim/lua/pde/typescript.lua
badd +1 ~/.config/nvim/lua/custom/chadrc.lua
badd +1 ~/.config/nvim/lua/custom/configs/overrides.lua
badd +2 man://END(7)
argglobal
%argdel
edit ~/.config/nvim/lua/custom/configs/lspconfig.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt ~/.config/nvim/lua/custom/init.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 86 - ((45 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 86
normal! 02|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
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
