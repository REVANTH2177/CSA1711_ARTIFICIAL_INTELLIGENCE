
% Experiment 17: Sum of Integers from 1 to N

sum(0, 0).

sum(N, S) :-
    N > 0,
    N1 is N - 1,
    sum(N1, S1),
    S is N + S1.

main :-
    write('Enter a number: '),
    read(N),
    (   integer(N), N >= 0
    ->  sum(N, S),
        write('Sum of integers = '),
        writeln(S)
    ;   writeln('Enter a non-negative integer')
    ).

:- initialization(main, main).
