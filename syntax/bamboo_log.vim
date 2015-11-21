" Vim syntax file
" Language:         Bamboo log files
" Maintainer:       Sergey Valiev <svaliev@gmail.com>

if exists("b:current_syntax")
  finish
endif

syn match BambooMessageBegin display /^/
          \ nextgroup=BambooErrorType,BambooBuildType,BambooSimpleType,BambooCommandType

" error
syn match BambooErrorType contained display /^error.*$/
hi def link BambooErrorType ErrorMsg

" simple
syn match BambooSimpleType contained display /^simple/
          \ nextgroup=BambooSimpleTime skipwhite
hi def link BambooSimpleType Operator

syn match BambooSimpleTime contained display /\d\d-.*-\d\d\d\d \d\d:\d\d:\d\d/
          \ nextgroup=BambooSimpleMessage skipwhite
hi def link BambooSimpleTime Constant

syn match BambooSimpleMessage contained display /.*/
          \ contains=FinishedTaskMessage,StartingTaskMessage

syn match FinishedTaskMessage contained display /Finished task.*/
syn match StartingTaskMessage contained display /Starting task.*/
hi def link FinishedTaskMessage Underlined
hi def link StartingTaskMessage Underlined

" build
syn match BambooBuildType contained display /^build/
          \ nextgroup=BambooBuildTime skipwhite
hi def link BambooBuildType String

syn match BambooBuildTime contained display /\d\d-.*-\d\d\d\d \d\d:\d\d:\d\d/
          \ nextgroup=BambooBuildMessage skipwhite
hi def link BambooBuildTime Constant

syn match BambooBuildMessage contained display /.*/
hi def link BambooBuildMessage Normal

" command
syn match BambooCommandType contained display /^command/
          \ nextgroup=BambooCommandTime skipwhite
hi def link BambooCommandType Number

syn match BambooCommandTime contained display /\d\d-.*-\d\d\d\d \d\d:\d\d:\d\d/
          \ nextgroup=BambooCommandMessage skipwhite
hi def link BambooCommandTime Constant

syn match BambooCommandMessage contained display /.*/
          \ contains=SubstitutingVar

syn match SubstitutingVar contained display /Substituting variable.*/
hi def link SubstitutingVar Underlined
