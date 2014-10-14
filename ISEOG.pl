endOfGameWithoutWinner(Xn)

# ------------ 3 conditions de victoire -------------

	# --- Xn : Plateau ----
	# --- J : Joueur ----
	# --- N : Verticale testée----
isWin(Xn,Colonne):-isVericalWin(Xn,Colonne,element(Pos,'_',colonne), element(element(Pos,'_',colonne)-1,Symbole,Colonne),1).
isWin(Xn):-isHorizontal(Xn,1).
isWin(Xn):-isDiagonal(Xn,1).


element(1,X,[X|_]):- !.
element(N,X,[_|L]):- P is N-1,element(P,X,L).

# element(numcolonne,colonne,X).
# element(Pos,'_',colonne).
# element(Pos-1,variable,colonne).

#------------ 1 : conditions de victoire sur la verticale -------------
	# --- Jeton : Nombre de Jetons d'affilé pour le joueur testé----
isVerticalWin(Xn,Colonne,PositionTeste,Symbole,Jeton):- Jeton == 4.
isVerticalWin(Xn,Colonne,PositionTeste,Symbole,Jeton) :- match(Colonne[positionTeste],Symbole,Jeton). 
# Match incremente Jeton si Symbole == Colonne[positionTeste]

isVerticalWin(Xn,Colonne,PositionTeste,Symbole,Jeton) :- isVerticalWin(Xn,Colonne,PositionTeste-1,Jeton)




