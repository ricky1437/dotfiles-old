if exists("b:current_syntax")
  finish
endif

syn match asarComment /;.*/
syn match asarAddress /$.*/
syn match asarString /".*."/

hi link asarComment Comment
hi link asarAddress Number
hi link asarString String
let b:current_syntax = "asar"
