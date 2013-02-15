if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn case ignore

syn match logfilesDate      "^[0-9]\+[:/\.].\{-}\ze\s"
syn match logfilesProcessid "\[[0-9]*\]"
syn match logfilesLogger    "\[.\{-}\]"

syn case match

syn match logfilesDebug "\<DEBUG\>"
syn match logfilesError "\<ERROR\>"
syn match logfilesFatal "\<FATAL\>"
syn match logfilesInfo "\<INFO\>"
syn match logfilesTrace "\<TRACE\>"
syn match logfilesWarn "\<WARN\>"



if version >= 508 || !exists("did_logfiles_syntax_inits")
    if version < 508
        let did_logfiles_syntax_inits = 1
        command! -nargs=+ HiLink hi link <args>
    else
        command! -nargs=+ HiLink hi def link <args>
    endif

    HiLink logfilesDate       Type
    HiLink logfilesError SpellBad
    HiLink logfilesWarn SpellCap
    HiLink logfilesInfo String
    HiLink logfilesDebug Keyword
    HiLink logfilesFatal ErrorMsg
    HiLink logfilesProcessid  Function
    HiLink logfilesLogger     Delimiter

    delcommand HiLink
endif

let b:current_syntax = "logfiles"
