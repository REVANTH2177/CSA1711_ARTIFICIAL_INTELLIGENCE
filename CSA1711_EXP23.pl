
% Experiment 23: Family Tree using Prolog

% Facts
male(ramesh).
male(suresh).
male(rahul).
male(arun).

female(lakshmi).
female(priya).
female(anitha).

parent(ramesh, suresh).
parent(lakshmi, suresh).
parent(ramesh, priya).
parent(lakshmi, priya).

parent(suresh, rahul).
parent(anitha, rahul).
parent(suresh, arun).
parent(anitha, arun).

% Rules
father(X, Y) :-
    male(X),
    parent(X, Y).

mother(X, Y) :-
    female(X),
    parent(X, Y).

grandfather(X, Y) :-
    male(X),
    parent(X, Z),
    parent(Z, Y).

grandmother(X, Y) :-
    female(X),
    parent(X, Z),
    parent(Z, Y).

brother(X, Y) :-
    male(X),
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

sister(X, Y) :-
    female(X),
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Main Program
main :-
    writeln('Family Tree using Prolog'),

    (father(ramesh, suresh) ->
        writeln('Ramesh is father of Suresh'); true),

    (mother(lakshmi, priya) ->
        writeln('Lakshmi is mother of Priya'); true),

    (grandfather(ramesh, rahul) ->
        writeln('Ramesh is grandfather of Rahul'); true),

    (grandmother(lakshmi, arun) ->
        writeln('Lakshmi is grandmother of Arun'); true),

    (brother(arun, rahul) ->
        writeln('Arun is brother of Rahul'); true),

    (sister(priya, suresh) ->
        writeln('Priya is sister of Suresh'); true).

:- initialization(main, main).
