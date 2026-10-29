
% Experiment 30 - Backward Chaining with Queries

% Initial facts
fact(has_fever).
fact(has_cough).

% Rules: rule(Conditions, Conclusion)
rule([has_fever, has_cough], has_flu).
rule([has_flu], needs_rest).
rule([needs_rest], should_consult_doctor).

% Backward chaining: prove a goal
prove(Goal) :-
    fact(Goal).

prove(Goal) :-
    rule(Conditions, Goal),
    prove_all(Conditions).

% Prove all conditions of a rule
prove_all([]).

prove_all([H|T]) :-
    prove(H),
    prove_all(T).

% Display the query result
answer_query(Query) :-
    (prove(Query) ->
        writeln('Query Result: YES')
    ;
        writeln('Query Result: NO')
    ).

% Main program
main :-
    writeln('Backward Chaining with Queries'),
    writeln('------------------------------'),
    writeln('Initial Facts:'),
    writeln('has_fever'),
    writeln('has_cough'),
    nl,
    writeln('Available Queries:'),
    writeln('has_flu'),
    writeln('needs_rest'),
    writeln('should_consult_doctor'),
    nl,
    write('Enter your query: '),
    read(Query),
    answer_query(Query).

:- initialization(main, main).
