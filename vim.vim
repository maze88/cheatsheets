:set paste  " allows correct pasting into vim when auto-indent is on.

" marks
mX  " creates a mark X at current context (where X is [a-zA-Z]).
'X  " go to mark X.

" folding
:set foldmethod=indent  " select folding method (manual/indent...).
vzf  " creates a fold for visually selected lines.
za  " toggles openong/closing of fold under cursor.
zd  " delete fold under cursor.
zk  " jump to previous fold.
zj  " jump to next fold.
