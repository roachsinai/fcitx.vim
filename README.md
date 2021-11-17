Keep and restore Windows Input Method state for each buffer separately when leaving/re-entering insert mode. Like always typing English in normal mode, but Chinese in insert mode when using Windows Pinyin Input Method.

You have to define two variable to let it work:

```
" lefttop and rightbelow coordinates of your native language's input method icon on task bar
" order: left top right below, and beware the spaces along both sides of each number
let g:inputmethod_icon_location = ' 1715 1047 1734 1065 '

" pixel values sum of your native language's input method icon on task bar
let g:inputmethod_icon_pixels_sum = '-1285013265'
```

After you setting variable `g:inputmethod_icon_location` in Cmdline, you can get the value which should set to `g:inputmethod_icon_pixels_sum` by `:echo GetIMIconPixelsSum()`.

Origin repo is created by @lilydjw for Linux, this repo only works for Windows (only test in WSL on Windows11).
