% pour ajouter le coup que joueur joue dans la sous-liste
% le nouveau element('X' ou 'O') va remplacer le premier '_'
add(['_'|L], E, [E|L]).
add([H|L1], E, [H|L2]) :-
	add(L1, E, L2).


% le fait basic pour le copy, il est la sortie de la règle
copy([], [], 0, _, _).

/* dans cette partie, pour les variables:
	N est le numéro de colonne actuelle.
	Pos est le numéro de colonne que le joueur va ajouter un coup.
	Nj est le coup, soit 'X' soit 'O'.
*/

/* ici, on a Pos==N, qui veut dire on est bien sur la colonne que on veut modifier,
	du coup, on appelle add() pour modifier cette colonne, et on décremente N pour 
	parcourir une autre colonne */

copy([H1|L1], [H2|L2], N, Pos, Nj) :-
	N > 0,
	Pos == N,
	N2 is N-1,
	add(H1,Nj,H2),
	copy(L1, L2, N2, Pos, Nj).

/* 	Lorsque Pos\==N, on décremente N pour 
	parcourir une autre colonne */

copy([H|L1], [H|L2], N, Pos, Nj) :-
	N > 0,
	Pos \== N,
	N2 is N-1,
	copy(L1, L2, N2, Pos, Nj).


/* au début, N est la longueur de la liste, dans notre cas, N est 8
	on appelle copy() pour réaliser la modification */

modif(X,Nj,S,Xn) :-
	length(X, N),
	copy(X, Xn, N, S, Nj).