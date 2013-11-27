" =============================================================================
" Filename: plugin/insert_mode_motion.vim
" Author: itchyny
" License: MIT License
" Last Change: 2013/11/27 14:09:06.
" =============================================================================

if exists('g:loaded_insert_mode_motion') && g:loaded_insert_mode_motion
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

inoremap <expr> <Plug>(insert_mode_motion-up) insert_mode_motion#cancel_popup_key("\<Up>")
inoremap <expr> <Plug>(insert_mode_motion-down) insert_mode_motion#cancel_popup_key("\<Down>")
inoremap <expr> <Plug>(insert_mode_motion-left) insert_mode_motion#cancel_popup_key("\<Left>")
inoremap <expr> <Plug>(insert_mode_motion-right) insert_mode_motion#cancel_popup_key("\<Right>")
inoremap <expr> <Plug>(insert_mode_motion-end) insert_mode_motion#cancel_popup_key("\<End>")
inoremap <expr> <Plug>(insert_mode_motion-home) insert_mode_motion#cancel_popup_key("\<Home>")
inoremap <expr> <Plug>(insert_mode_motion-del) insert_mode_motion#cancel_popup_key("\<Del>")
inoremap <expr> <Plug>(insert_mode_motion-bs) insert_mode_motion#cancel_popup_key("\<BS>")
inoremap <expr> <Plug>(insert_mode_motion-delhome) insert_mode_motion#cancel_popup_key("\<C-u>")
nnoremap <expr> <Plug>(insert_mode_motion-normal-up) insert_mode_motion#goback_insert("\<Up>")
nnoremap <expr> <Plug>(insert_mode_motion-normal-down) insert_mode_motion#goback_insert("\<Down>")
nnoremap <expr> <Plug>(insert_mode_motion-normal-right) insert_mode_motion#goback_insert("\<Right>")
nnoremap <expr> <Plug>(insert_mode_motion-normal-left) insert_mode_motion#goback_insert("\<Left>")
nnoremap <expr> <Plug>(insert_mode_motion-normal-end) insert_mode_motion#goback_insert("\<End>")
nnoremap <expr> <Plug>(insert_mode_motion-normal-home) insert_mode_motion#goback_insert("\<Home>")
nnoremap <expr> <Plug>(insert_mode_motion-normal-del) insert_mode_motion#goback_insert("\<Del>")
nnoremap <expr> <Plug>(insert_mode_motion-normal-pageup) insert_mode_motion#goback_insert("\<PageUp>")
nnoremap <expr> <Plug>(insert_mode_motion-normal-pagedown) insert_mode_motion#goback_insert("\<PageDown>")

if get(g:, 'insert_mode_motion_default_mapping', 1)
  imap <C-p> <Plug>(insert_mode_motion-up)
  imap <C-n> <Plug>(insert_mode_motion-down)
  imap <C-b> <Plug>(insert_mode_motion-left)
  imap <C-f> <Plug>(insert_mode_motion-right)
  imap <C-e> <Plug>(insert_mode_motion-end)
  imap <C-a> <Plug>(insert_mode_motion-home)
  imap <C-d> <Plug>(insert_mode_motion-del)
  imap <C-h> <Plug>(insert_mode_motion-bs)
  imap <C-u> <Plug>(insert_mode_motion-delhome)
  imap <Up> <Plug>(insert_mode_motion-up)
  imap <Down> <Plug>(insert_mode_motion-down)
  imap <Left> <Plug>(insert_mode_motion-left)
  imap <Right> <Plug>(insert_mode_motion-right)
  if get(g:, 'insert_mode_motion_normal_mapping', 0)
    nmap OA <Plug>(insert_mode_motion-normal-up)
    nmap OB <Plug>(insert_mode_motion-normal-down)
    nmap OC <Plug>(insert_mode_motion-normal-right)
    nmap OD <Plug>(insert_mode_motion-normal-left)
    nmap OF <Plug>(insert_mode_motion-normal-end)
    nmap OH <Plug>(insert_mode_motion-normal-home)
    nmap [3~ <Plug>(insert_mode_motion-normal-del)
    nmap [5~ <Plug>(insert_mode_motion-normal-pageup)
    nmap [6~ <Plug>(insert_mode_motion-normal-pagedown)
  else
    nmap OA <Nop>
    nmap OB <Nop>
    nmap OC <Nop>
    nmap OD <Nop>
    nmap OF <Nop>
    nmap OH <Nop>
    nmap [3~ <Nop>
    nmap [5~ <Nop>
    nmap [6~ <Nop>
  endif
endif

let g:loaded_insert_mode_motion = 1

let &cpo = s:save_cpo
unlet s:save_cpo
