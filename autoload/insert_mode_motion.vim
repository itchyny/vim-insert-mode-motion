" =============================================================================
" Filename: autoload/insert_mode_motion.vim
" Author: itchyny
" License: MIT License
" Last Change: 2013/11/07 17:39:22.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! s:sourced(plugin)
  if exists('*neobundle#is_sourced')
    return neobundle#is_sourced(a:plugin)
  else
    return !!len(globpath(&rtp, 'plugin/' . a:plugin . '**'))
  endif
endfunction

if s:sourced('neocomplete.vim')
  function! s:cancel_popup()
    return neocomplete#cancel_popup()
  endfunction
elseif s:sourced('neocomplcache')
  function! s:cancel_popup()
    return neocomplcache#cancel_popup()
  endfunction
else
  function! s:cancel_popup()
    return pumvisible() ? "\<C-e>" : ''
  endfunction
endif

function! insert_mode_motion#cancel_popup_key(key)
  return s:cancel_popup() . a:key
endfunction

function! insert_mode_motion#goback_insert(key)
  return "gi" . s:cancel_popup() . a:key . s:cancel_popup()
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
