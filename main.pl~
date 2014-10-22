%-------------------------------------------------------------------------------------------
:- dynamic 	p/1.

% Il faut tout remplir
p([['_','_','_','_','_','_'],
['_','_','_','_','_','_'],
['_','_','_','_','_','_'],
['_','_','_','_','_','_'],
['_','_','_','_','_','_'],
['_','_','_','_','_','_'],
['_','_','_','_','_','_']
]).

liste:- liste(1,1).

liste(7,6):- !.
liste(7,L):- write('
'), Q is L+1, liste(1,Q).
liste(C,L):- p(Liste), nth0(C,Liste,E), nth0(L,E,X), write(X),write(' '),P is C+1, liste(P,L).

jouer('x').
jouer('o').

%-------------------------------------------------------------------------------------------
%atteint le N-ième élément X de la liste
element(1,X,[X|_]):- !.
element(N,X,[_|L]):- P is N-1,element(P,X,L).

%vérifie que le coup est possible
%X est le plateau de jeu
%S est le numéro de colonne dans laquelle on veut jouer
coupPossible(X,S) :- checkSbound(S), checkXempty(X,S).

%vérifie que S est dans les bornes imposées (les 7 colonnes)
checkSbound(S):- member(S,[1,2,3,4,5,6,7]).

%vérifie que la colonne n'est pas pleine'
checkXempty(X,S) :- element(S,E,X),member('_',E).

%-------------------------------------------------------------------------------------------
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
%-------------------------------------------------------------------------------------------
/*
	isEOG/1
	param1 = The game board represented as a list of
	the columns where game chips can be put.
	Returns = true if there are four in a row in one of the
	three directions (horizontally, vertically and
	diagonally), false oterwise.
*/
/*TODO*/
isEOG(X) :-
	checkVertical(X).
isEOG(X) :-
	checkHorizontal(X).
isEOG(X) :-
	checkDiagonal(X).
isEOG(X) :-
	checkDraw(X).
/*
	segment/1
	param1 = The list we want to check.
	Checks if there are four identical pieces of x or o in
	a row within a list.
	Returns = true if there are four in a row, false
	otherwise.
*/
segment([x,x,x,x|_]).
segment([o,o,o,o|_]).
segment([Y|Z]) :-
	segment(Z).

/*
	checkHorizontal/1
	param1 = The game board represented as a list of
	the columns where game chips can be put.
	Returns = true if there are four in a row in one of the
	rows, false oterwise.
*/
checkHorizontal([[X1|X1T],[X2|X2T],[X3|X3T],[X4|X4T],[X5|X5T],[X6|X6T],[X7|X7T]]) :-
	segment([X1,X2,X3,X4,X5,X6,X7]).
checkHorizontal([[X1|X1T],[X2|X2T],[X3|X3T],[X4|X4T],[X5|X5T],[X6|X6T],[X7|X7T]]) :-
	checkHorizontal([X1T,X2T,X3T,X4T,X5T,X6T,X7T]).

/*
	checkVertical/1
	param1 = The game board represented as a list of
	the columns where game chips can be put.
	Returns = true if there are four in a row in one of the
	columns, false oterwise.
*/
checkVertical([X|XT]) :-
	segment(X).
checkVertical([X|XT]) :-
	checkVertical(XT).

/*
	checkDiagonal/1
	param1 = The game board represented as a list of
	the columns where game chips can be put.
	Returns = true if there are four in a row in one of the
	diagonals, false oterwise.

	P.S. God, I hate Prolog!!!
*/
checkDiagonal([_,_,_,[X41|X4T],[X51,X52|X5T],[X61,X62,X63|X6T],[X71,X72,X73,X74|X7T]]) :-
	segment([X41,X52,X63,X74]).

checkDiagonal([_,_,[X31|X3T],[X41,X42|X4T],[X51,X52,X53|X5T],[X61,X62,X63,X64|X6T],[X71,X72,X73,X74,X75|X7T]]) :-
	segment([X31,X42,X53,X64,X75]).

checkDiagonal([_,[X21|X2T],[X31,X32|X3T],[X41,X42,X43|X4T],[X51,X52,X53,X54|X5T],[X61,X62,X63,X64,X65|X6T],[X71,X72,X73,X74,X75,X76|X7T]]) :-
	segment([X21,X32,X43,X54,X65,X76]).

checkDiagonal([[X11|X1T],[X21,X22|X2T],[X31,X32,X33|X3T],[X41,X42,X43,X44|X4T],[X51,X52,X53,X54,X55|X5T],[X61,X62,X63,X64,X65,X66|X6T],_]) :-
	segment([X11,X22,X33,X44,X55,X66]).

checkDiagonal([[X11,X12|X1T],[X21,X22,X23|X2T],[X31,X32,X33,X34|X3T],[X41,X42,X43,X44,X45|X4T],[X51,X52,X53,X54,X55,X56|X5T],_,_]) :-
	segment([X12,X23,X34,X45,X56]).

checkDiagonal([[X11,X12,X13|X1T],[X21,X22,X23,X24|X2T],[X31,X32,X33,X34,X35|X3T],[X41,X42,X43,X44,X45,X46|X4T],_,_,_]) :-
	segment([X13,X24,X35,X46]).

checkDiagonal([[X11,X12,X13,X14|X1T],[X21,X22,X23|X2T],[X31,X32|X3T],[X41|X4T],_,_,_]) :-
	segment([X14,X23,X32,X41]).

checkDiagonal([[X11,X12,X13,X14,X15|X1T],[X21,X22,X23,X24|X2T],[X31,X32,X33|X3T],[X41,X42|X4T],[X51|X5T],_,_]) :-
	segment([X15,X24,X33,X42,X51]).

checkDiagonal([[X11,X12,X13,X14,X15,X16|X1T],[X21,X22,X23,X24,X25|X2T],[X31,X32,X33,X34|X3T],[X41,X42,X43|X4T],[X51,X52|X5T],[X61|X6T],_]) :-
	segment([X16,X25,X34,X43,X52,X61]).

checkDiagonal([_,[X21,X22,X23,X24,X25,X26|X2T],[X31,X32,X33,X34,X35|X3T],[X41,X42,X43,X44|X4T],[X51,X52,X53|X5T],[X61,X62|X6T],[X71|X7T]]) :-
	segment([X26,X35,X44,X53,X62,X71]).

checkDiagonal([_,_,[X31,X32,X33,X34,X35,X36|X3T],[X41,X42,X43,X44,X45|X4T],[X51,X52,X53,X54|X5T],[X61,X62,X63|X6T],[X71,X72|X7T]]) :-
	segment([X36,X45,X54,X63,X72]).

checkDiagonal([_,_,_,[X41,X42,X43,X44,X45,X46|X4T],[X51,X52,X53,X54,X55|X5T],[X61,X62,X63,X64|X6T],[X71,X72,X73|X7T]]) :-
	segment([X46,X55,X64,X73]).

/*
	checkDraw/1
	param1 = The game board represented as a list of
	the columns (represented as lists) where game chips can
	be put.
	Returns = true if the game is a draw, false otherwise.
*/
checkDraw([[X1|X1T],[X2|X2T],[X3|X3T],[X4|X4T],[X5|X5T],[X6|X6T],[X7|X7T]]) :-
	draw([X1,X2,X3,X4,X5,X6,X7]).

cpy(L,R) :- accCp(L,R).
accCp([],[]).
accCp([H|T1],[H|T2]) :-
	accCp(T1,T2).

/*
	Untested, but should work... I hope.
*/

draw([x|XT]) :-
	draw(XT).
draw([o|XT]) :-
	draw(XT).

%-------------------------------------------------------------------------------------------

nouveauCoup(Joueur,NumCol) :-
	p(X),
	jouer(Joueur),
	coupPossible(X,NumCol),
	modif(X,Joueur,NumCol,NewX),
	\+isEOG(NewX),
	write(X),nl,
	write(NewX),nl.
		/*retract(p(X)),
		assert(p(NewX)),
		liste.*/

