scriptencoding utf-8
" fcitx.vim	remember fcitx's input state for each buffer
" Author:       lilydjwg
" Version:	2.0a
" URL:		https://www.vim.org/scripts/script.php?script_id=3764
" ---------------------------------------------------------------------
" Load Once:
if &cp || exists("g:loaded_fcitx")
  finish
endif
let s:keepcpo = &cpo
set cpo&vim

let g:inputmethod_icon_location = get(g:, 'inputmethod_icon_location', ' 1715 1047 1734 1065 ')
let g:inputmethod_icon_pixels_sum = get(g:, 'inputmethod_icon_pixels_sum', '-1285013265')
let s:win_input_shift = expand('<sfile>:h:h') . '/bin/analog_input_shift.exe'
let s:imputmethod_icon_recongnize = expand('<sfile>:h:h') . '/bin/inputmethod_icon_recognize.exe'

function GetInputStatus()
  return trim(system(s:imputmethod_icon_recongnize . g:inputmethod_icon_location . g:inputmethod_icon_pixels_sum))
endfunction

function IM2en()
  let inputstatus = GetInputStatus()
  if inputstatus == '2'
    let b:inputtoggle = 1
    call system(s:win_input_shift . ' 30')
  endif
endfunction

function IM2native()
  try
    if b:inputtoggle == 1
      call system(s:win_input_shift . ' 70')
      let b:inputtoggle = 0
    endif
  catch /inputtoggle/
    let b:inputtoggle = 0
  endtry
endfunction

let g:loaded_fcitx = 1

" Register autocmd if successfully loaded.
if exists("g:loaded_fcitx")
  if exists('##InsertLeavePre')
    au InsertLeavePre * call IM2en()
  else
    au InsertLeave * call IM2en()
  endif
  au InsertEnter * call IM2native()
  " au CmdlineEnter [/\?] call IM2native()
  " au CmdlineLeave [/\?] call IM2en()
endif

" ---------------------------------------------------------------------
"  Restoration And Modelines:
let &cpo=s:keepcpo
unlet s:keepcpo

" vim: sw=2 :
