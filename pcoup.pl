%----- PREDICATS UTILES -----%

%recherche un élément X dans la liste
member(X,[X|_]):- !.
member(X,[_|L]):- member(X,L).

%atteint le N-ième élément X de la liste
element(1,X,[X|_]):- !.
element(N,X,[_|L]):- P is N-1,element(P,X,L).

%----- FIN PREDICATS -----%




%vérifie que le coup est possible
%X est le plateau de jeu
%S est le numéro de colonne dans laquelle on veut jouer
coupPossible(X,S) :- checkSbound(S), checkXempty(X,S).

%vérifie que S est dans les bornes imposées (les 8 colonnes)
checkSbound(S):- member(S,[1,2,3,4,5,6,7,8]).

%vérifie que la colonne n'est pas pleine
checkXempty(X,S) :- element(S,E,X),member('_',E).