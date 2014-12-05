" =============================================================================
" Filename: plugin/insert_mode_motion.vim
" Author: itchyny
" License: MIT License
" Last Change: 2014/12/05 23:55:23.
" =============================================================================

if exists('g:loaded_insert_mode_motion') && g:loaded_insert_mode_motion
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

inoremap <expr> <Plug>(insert-mode-motion-up) insert_mode_motion#cancel_popup_key("\<Up>")
inoremap <expr> <Plug>(insert-mode-motion-down) insert_mode_motion#cancel_popup_key("\<Down>")
inoremap <expr> <Plug>(insert-mode-motion-left) insert_mode_motion#cancel_popup_key("\<Left>")
inoremap <expr> <Plug>(insert-mode-motion-right) insert_mode_motion#cancel_popup_key("\<Right>")
inoremap <expr> <Plug>(insert-mode-motion-end) insert_mode_motion#cancel_popup_key("\<End>")
inoremap <expr> <Plug>(insert-mode-motion-home) insert_mode_motion#cancel_popup_key("\<Home>")
inoremap <expr> <Plug>(insert-mode-motion-del) insert_mode_motion#cancel_popup_key("\<Del>")
inoremap <expr> <Plug>(insert-mode-motion-bs) insert_mode_motion#cancel_popup_key("\<BS>")
inoremap <expr> <Plug>(insert-mode-motion-delhome) insert_mode_motion#cancel_popup_key("\<C-u>")

if get(g:, 'insert_mode_motion_default_mapping', 1)
  imap <C-p> <Plug>(insert-mode-motion-up)
  imap <C-n> <Plug>(insert-mode-motion-down)
  imap <C-b> <Plug>(insert-mode-motion-left)
  imap <C-f> <Plug>(insert-mode-motion-right)
  imap <C-e> <Plug>(insert-mode-motion-end)
  imap <C-a> <Plug>(insert-mode-motion-home)
  imap <C-d> <Plug>(insert-mode-motion-del)
  imap <C-h> <Plug>(insert-mode-motion-bs)
  imap <C-u> <C-g>u<Plug>(insert-mode-motion-delhome)
  imap <Up> <Plug>(insert-mode-motion-up)
  imap <Down> <Plug>(insert-mode-motion-down)
  imap <Left> <Plug>(insert-mode-motion-left)
  imap <Right> <Plug>(insert-mode-motion-right)
endif

let g:loaded_insert_mode_motion = 1

let &cpo = s:save_cpo
unlet s:save_cpo
