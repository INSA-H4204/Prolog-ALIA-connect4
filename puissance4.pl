:- dynamic p/1.

% space de jeu vide
p([['_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_']]).

% affiche l'espace de jeu en 'console'
liste:- liste(0,0).
liste(7,7):- writeElement(7,7), !.
liste(7,L):- writeElement(7,L), writeln(''), Q is L+1, liste(0,Q).
liste(C,L):- writeElement(C,L), write(' '),P is C+1, liste(P,L).

writeElement(C,L):- p(Liste), nth0(C,Liste,E), nth0(L,E,X), write(X).
