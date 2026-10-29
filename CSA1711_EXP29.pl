
% Experiment 29 - Forward Chaining with Queries

:- dynamic known/1.

% Initial facts
known(has_fever).
known(has_cough).

% Rules: rule(Conditions, Conclusion)
rule([has_fever, has_cough], has_flu).
rule([has_flu], needs_rest).
rule([needs_rest], should_consult_doctor).

% Check whether all conditions are known
all_known([]).

all_known([H|T]) :-
    known(H),
    all_known(T).

% Apply one rule to derive a new fact
apply_rule :-
    rule(Conditions, Conclusion),
    all_known(Conditions),
    \+ known(Conclusion),
    assertz(known(Conclusion)),
    write('Derived: '),
    writeln(Conclusion).

% Repeat until no new facts can be derived
forward_chain :-
    apply_rule,
    !,
    forward_chain.

forward_chain.

% Display all known facts
show_facts :-
    known(Fact),
    write('- '),
    writeln(Fact),
    fail.

show_facts.

% Answer a query
answer_query(Query) :-
    (known(Query) ->
        writeln('Query Result: YES')
    ;
        writeln('Query Result: NO')
    ).

% Main program
main :-
    writeln('Forward Chaining with Queries'),
    writeln('-----------------------------'),
    writeln('Initial Facts:'),
    show_facts,
    nl,
    writeln('Applying Forward Chaining...'),
    forward_chain,
    nl,
    writeln('Final Known Facts:'),
    show_facts,
    nl,
    writeln('Available Queries:'),
    writeln('has_flu, needs_rest, should_consult_doctor'),
    write('Enter your query: '),
    read(Query),
    answer_query(Query).

:- initialization(main, main).
