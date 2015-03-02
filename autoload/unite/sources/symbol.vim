"=============================================================================
" FILE: symbol.vim
" AUTHOR: atton <e115763@gmail.com>
" License: MIT license {{{
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be included
" in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
" OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
" IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
" CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
" TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
" SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! unite#sources#symbol#define()
    return s:unite_symbol
endfunction

let s:unite_symbol = {'name' : 'symbol'}
let s:symbol_dict = {
\   "\u220e" : 'qed END-OF-PROOF',
\   "\u2218" : 'comp RING-OPERATOR',
\   "\u2219" : '. BULLET-OPERATOR',
\   "\u2261" : '== equivalence equiv IDENTICAL-TO',
\   "\u27e8" : '< langle MATHEMATICAL-LEFT-ANGLE-BRACKET',
\   "\u27e9" : '> rangle MATHEMATICAL-RIGHT-ANGLE-BRACKET',
\}

let s:symbol_to_unite_element = '{
\       "word": v:key . " : " . v:val,
\       "source": "symbol",
\       "kind": "command",
\       "action__command": "call unite#kinds#common#insert_word(\"" . v:key . "\")"
\   }'
let s:symbol_details = values(map(s:symbol_dict, s:symbol_to_unite_element))

function! s:unite_symbol.gather_candidates(args, context)
    return s:symbol_details
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
