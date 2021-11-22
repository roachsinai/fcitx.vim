Keep and restore Windows Input Method state for each buffer separately when leaving/re-entering insert mode. Like always typing English in normal mode, but Chinese in insert mode when using Windows Pinyin Input Method.

You have to define two variable to let it work:

```
" lefttop and rightbelow coordinates of your native language's input method icon on task bar
" order: left top right below, and beware the spaces along both sides of each number
let g:inputmethod_icon_location = ' 1715 1047 1734 1065 '

" if different pixel value of your native language's input method icon on task bar
" is smaller than threashold analog shift will be triggered when you switch Vim mode
let g:inputmethod_icon_different_pixel_value_threshold = '25'
```

After you setting variable `g:inputmethod_icon_location` in Cmdline, you can get the value which should set to `g:inputmethod_icon_different_pixel_value_threshold` by `:echo GetIMIconConditionValue()`.

Source code and compile command of binaries under `bin` directory at [windows-im-shift-cpp](https://github.com/roachsinai/windows-im-shift-cpp).

What's more, this plugin will not work when the input method icon shift along taskbar after you set its location. Maybe you should disable the notification of Windows screenshot tools, as notification icon on taskbar will show each time you use these tools.

# Acknowledgements

This repo only works for Windows (only in WSL on Windows11 tested), as original repo created by @lilydjwg is good enough for Linux!
