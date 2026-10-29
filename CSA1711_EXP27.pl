
% Experiment 27 - Best First Search Algorithm

% Graph connections
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(d, g).
edge(e, g).
edge(f, g).

% Heuristic values
heuristic(a, 6).
heuristic(b, 4).
heuristic(c, 2).
heuristic(d, 3).
heuristic(e, 1).
heuristic(f, 1).
heuristic(g, 0).

% Greedy Best First Search
best_first(Start, Goal, Path) :-
    search([[Start]], Goal, ReversePath),
    reverse(ReversePath, Path).

% Goal reached
search([[Goal|Rest]|_], Goal, [Goal|Rest]).

% Expand node with lowest heuristic
search([[Current|Rest]|OtherPaths], Goal, Path) :-
    Current \= Goal,
    findall(
        [Next,Current|Rest],
        (edge(Current, Next),
         \+ member(Next, [Current|Rest])),
        NewPaths
    ),
    append(OtherPaths, NewPaths, AllPaths),
    sort_paths(AllPaths, SortedPaths),
    search(SortedPaths, Goal, Path).

% Sort paths based on heuristic
sort_paths(Paths, Sorted) :-
    findall(
        H-P,
        (member(P, Paths),
         P = [Node|_],
         heuristic(Node, H)),
        Pairs
    ),
    keysort(Pairs, SortedPairs),
    findall(P, member(_-P, SortedPairs), Sorted).

% Display path
show_path([]).

show_path([Node|Rest]) :-
    write(Node),
    (Rest = [] -> nl ; write(' -> ')),
    show_path(Rest).

% Main program
main :-
    writeln('Best First Search Algorithm'),
    writeln('---------------------------'),
    best_first(a, g, Path),
    write('Path from a to g: '),
    show_path(Path),
    writeln('Goal Reached Successfully!').

:- initialization(main, main).
