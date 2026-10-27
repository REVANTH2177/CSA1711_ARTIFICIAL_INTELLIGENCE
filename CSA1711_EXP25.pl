
% Experiment 25: Factorial using Prolog

factorial(0, 1).

factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

main :-
    writeln('Factorial using Prolog'),
    write('Enter a number: '),
    read(N),
    (integer(N), N >= 0 ->
        factorial(N, F),
        write('Factorial = '),
        writeln(F)
    ;
        writeln('Invalid input')
    ).

:- initialization(main, main).
