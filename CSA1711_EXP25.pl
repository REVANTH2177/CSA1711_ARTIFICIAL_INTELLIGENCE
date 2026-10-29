
% Experiment 25 - Monkey Banana Problem

% State format:
% state(MonkeyPosition, BoxPosition, MonkeyStatus, BananaStatus)

% Initial state
initial(state(door, window, floor, no)).

% Goal state
goal(state(_, _, _, yes)).

% Monkey walks towards the box
move(state(P, B, floor, no),
     walk(P, B),
     state(B, B, floor, no)) :-
    P \= B.

% Monkey pushes the box to the middle
move(state(P, P, floor, no),
     push(P, middle),
     state(middle, middle, floor, no)) :-
    P \= middle.

% Monkey climbs the box
move(state(middle, middle, floor, no),
     climb,
     state(middle, middle, onbox, no)).

% Monkey grabs the banana
move(state(middle, middle, onbox, no),
     grab,
     state(middle, middle, onbox, yes)).

% Solve using recursion
solve(State, _, []) :-
    goal(State).

solve(State, Visited, [Action|Rest]) :-
    move(State, Action, Next),
    \+ member(Next, Visited),
    solve(Next, [Next|Visited], Rest).

% Display solution
show_actions([]).

show_actions([H|T]) :-
    writeln(H),
    show_actions(T).

% Main program
main :-
    writeln('Monkey Banana Problem'),
    initial(State),
    solve(State, [State], Actions),
    writeln('Solution Steps:'),
    show_actions(Actions),
    writeln('Monkey successfully got the banana!').

:- initialization(main, main).
