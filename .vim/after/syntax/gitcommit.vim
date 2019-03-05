syn clear   gitcommitSummary
syn match   gitcommitSummary    "^.\{0,72\}" contained containedin=gitcommitFirstLine nextgroup=gitcommitOverflow contains=@Spell

hi diffAdded   ctermfg=green
hi diffRemoved ctermfg=red

