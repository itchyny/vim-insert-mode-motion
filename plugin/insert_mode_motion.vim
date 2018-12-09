" =============================================================================
" Filename: plugin/insert_mode_motion.vim
" Author: itchyny
" License: MIT License
" Last Change: 2018/12/09 17:46:19.
" =============================================================================

if exists('g:loaded_insert_mode_motion') || v:version < 700
  finish
endif
let g:loaded_insert_mode_motion = 1

let s:save_cpo = &cpo
set cpo&vim

inoremap <expr> <Plug>(insert-mode-motion-up) <SID>key("\<Up>")
inoremap <expr> <Plug>(insert-mode-motion-down) <SID>key("\<Down>")
inoremap <expr> <Plug>(insert-mode-motion-left) <SID>key("\<Left>")
inoremap <expr> <Plug>(insert-mode-motion-right) <SID>key("\<Right>")
inoremap <expr> <Plug>(insert-mode-motion-end) <SID>key("\<End>")
inoremap <expr> <Plug>(insert-mode-motion-home) <SID>key("\<Home>")
inoremap <expr> <Plug>(insert-mode-motion-del) <SID>key("\<Del>")
inoremap <expr> <Plug>(insert-mode-motion-bs) <SID>key("\<BS>")
inoremap <expr> <Plug>(insert-mode-motion-delhome) <SID>key("\<C-u>")

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

function! s:sourced(plugin) abort
  return globpath(&rtp, 'plugin/' . a:plugin . '**') !=# ''
endfunction

if s:sourced('neocomplete.vim')
  function! s:cancel() abort
    return neocomplete#cancel_popup()
  endfunction
elseif s:sourced('neocomplcache')
  function! s:cancel() abort
    return neocomplcache#cancel_popup()
  endfunction
else
  function! s:cancel() abort
    return pumvisible() ? "\<C-e>" : ''
  endfunction
endif

function! s:key(key) abort
  return s:cancel() . a:key
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
