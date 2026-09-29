% ---------- FACTS ----------

% Male
male(abraham).
male(herb).
male(homer).
male(clancy).
male(bart).

% Female
female(mona).
female(marge).
female(jackie).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent
parent(abraham, herb).
parent(abraham, homer).
parent(mona, herb).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).


% ---------- RULES ----------

father(X,Y) :- parent(X,Y), male(X).

mother(X,Y) :- parent(X,Y), female(X).

son(X,Y) :- parent(Y,X), male(X).

daughter(X,Y) :- parent(Y,X), female(X).

sibling(X,Y) :- parent(P,X), parent(P,Y), X \= Y.

brother(X,Y) :- sibling(X,Y), male(X).

sister(X,Y) :- sibling(X,Y), female(X).

grandfather(X,Y) :- parent(X,P), parent(P,Y), male(X).

aunt(X,Y) :- parent(P,Y), sister(X,P).

uncle(X,Y) :- parent(P,Y), brother(X,P).

cousin(X,Y) :- parent(P1,X), parent(P2,Y), sibling(P1,P2).

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).
