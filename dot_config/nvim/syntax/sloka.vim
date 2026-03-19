if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "sloka"

" ── Structural markers ──────────────────────────────────────────────────────
" === citation text ===
syn match slokaCitation   /^===.\+===$/
" --- line ---
syn match slokaLineMarker /^--- line ---$/

" ── Glosses ─────────────────────────────────────────────────────────────────
" Translation gloss  [shown in animation]
syn match slokaTransGloss /\[[^\]]*\]/
" Etymology gloss    {hidden by default}
syn match slokaEtymGloss  /{[^}]*}/

" ── Sandhi compound operators ────────────────────────────────────────────────
" +  joins components,  =  introduces the sandhi surface form
syn match slokaSandhi     /[+=]/
" Parentheses for nested sandhi groups  (a+b=ab)
syn match slokaParen      /[()]/

" ── Quoted English translation ───────────────────────────────────────────────
syn region slokaEnglish   start=/"/ end=/"/ oneline

" ── Punctuation tokens  (.. must beat . so it's listed first) ────────────────
syn match slokaPunct      /\.\.\|[.;]/

" ── Vedic accent / swara marks  \' (udātta)  \_ (anudātta) ──────────────────
" These are two-character sequences inside SLP1 tokens.
syn match slokaSwara      /\\[_']/

" ── Highlight links (override any of these in your colorscheme) ──────────────
hi def link slokaCitation   Title       " bright / bold  — the śruti reference
hi def link slokaLineMarker PreProc     " pāda boundary marker
hi def link slokaTransGloss String      " [translation glosses]
hi def link slokaEtymGloss  Comment    " {etymology, greyed out}
hi def link slokaSandhi     Operator    " + =
hi def link slokaParen      Delimiter   " ( )
hi def link slokaEnglish    Constant    " "quoted English"
hi def link slokaPunct      Special     " .  ..  ;
hi def link slokaSwara      SpecialChar " \' \_
