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
	copy(X,R),
	checkVertical(R).
isEOG(X) :-
	copy(X,R),
	checkHorizontal(R).
isEOG(X) :-
	copy(X,R),
	checkDiagonal(R).
isEOG(X) :-
	copy(X,R),
	checkDraw(R).
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
checkDraw([[X1|X1T],[X2|X2T],[X3|X3T],[X4|X4T],[X5|X5T],[X6|X6T],[X7|X7T],[X8|X8T]]) :-
	draw([X1,X2,X3,X4,X5,X6,X7,X8]).

/*
	Might be unnecessary. Further testing needed.
*/
copy(L,R) :- accCp(L,R).
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

t1:-
isEOG([[x,0,0,0,0,0],[o,0,0,0,0,0],[x,0,0,0,0,0],[o,0,0,0,0,0],[x,o,0,0,0,0],[o,0,o,0,0,0],[x,0,0,o,0,0]]).

t2:-
isEOG([[x,0,0,0,0,0],[o,0,0,0,0,0],[x,0,0,0,0,0],[o,0,0,0,0,0],[x,o,0,0,0,0],[o,0,o,0,0,0],[x,0,0,o,0,0]]).

t3:-
isEOG([[x,0,0,0,0,0],[o,0,0,0,0,0],[x,0,0,0,0,0],[o,0,0,0,0,0],[x,o,0,0,0,0],[o,0,o,0,0,0],[x,0,0,o,0,0]]).

t4:-
isEOG([[x,0,0,0,0,0],[o,0,0,0,0,0],[x,0,0,0,0,0],[o,0,0,0,0,0],[x,o,0,0,0,0],[o,0,o,0,0,0],[x,0,0,o,0,0]]).

t5:-
isEOG([[x,0,0,0,0,0],[o,0,0,0,0,0],[x,0,0,0,0,0],[o,0,0,0,0,0],[x,o,0,0,0,0],[o,0,o,0,0,0],[x,0,0,o,0,0]]).

tests:-
	t1,
	t2,
	t3,
	t4.

go:-
	consult('isEOG.pl'),
	tests.
