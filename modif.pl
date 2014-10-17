% pour ajouter le coup que joueur joue dans la sous-liste
% le nouveau element('X' ou 'O') va remplacer le dernier '_'
add(['_'|L], E, [E|L]).
add([H|L1], E, [H|L2]) :-
	add(L1, E, L2).

ajouterCoup(L1,E,L2) :-
	reverse(L1,R1),
	add(R1,E,R2),
	reverse(R2,L2).

% le fait basic pour le copy, il est la sortie de la règle
copy([], [], _, _,_,_).

/* dans cette partie, pour les variables:
	N est le numéro de colonne actuelle.
	Pos est le numéro de colonne que le joueur va ajouter un coup.
	Nj est le coup, soit 'X' soit 'O'.
*/

/* ici, on a Pos==N, qui veut dire on est bien sur la colonne que on veut modifier,
	du coup, on appelle add() pour modifier cette colonne, et on décremente N pour 
	parcourir une autre colonne */

copy([H1|L1], [H2|L2], Joueur, NumCol, Nmax, N) :-
	NumCol == N,
	N2 is N+1,
	ajouterCoup(H1,Joueur,H2),
	copy(L1, L2, Joueur, NumCol, Nmax, N2).

/* 	Lorsque Pos\==N, on décremente N pour 
	parcourir une autre colonne */

copy([H|L1], [H|L2], Joueur, NumCol, Nmax, N) :-
	NumCol \== N,
	N2 is N+1,
	copy(L1, L2, Joueur, NumCol, Nmax, N2).


/* au début, N est la longueur de la liste, dans notre cas, N est 8
	on appelle copy() pour réaliser la modification */

modif(X,Joueur,NumCol,NewX) :-
	length(X, Nmax),
	N=1,
	copy(X, NewX, Joueur, NumCol, Nmax, N).