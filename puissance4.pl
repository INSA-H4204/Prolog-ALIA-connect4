:- dynamic 	p/1.

% Il faut tout remplir
p([['_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_']]).

liste:- liste(0,0).

liste(8,8):- writeElement(8,8), !.
liste(8,L):- writeElement(8,L), writeln(''), Q is L+1, liste(0,Q).
liste(C,L):- writeElement(C,L), write(' '),P is C+1, liste(P,L).

writeElement(C,L):- p(Liste), nth0(C,Liste,E), nth0(L,E,X), write(X).
