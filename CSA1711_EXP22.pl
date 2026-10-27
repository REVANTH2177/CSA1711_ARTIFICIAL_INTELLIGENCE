
% Experiment 22: Bird Flying Ability

% Facts
bird(sparrow).
bird(parrot).
bird(eagle).
bird(penguin).
bird(ostrich).

% Birds that cannot fly
flightless(penguin).
flightless(ostrich).

% Rule to check flying ability
can_fly(X) :-
    bird(X),
    \+ flightless(X).

% Display result for a bird
check_bird(X) :-
    (can_fly(X) ->
        write(X), writeln(' can fly')
    ;
        write(X), writeln(' cannot fly')
    ).

% Main program
main :-
    writeln('Bird Flying Ability'),
    check_bird(sparrow),
    check_bird(parrot),
    check_bird(eagle),
    check_bird(penguin),
    check_bird(ostrich).

:- initialization(main, main).
