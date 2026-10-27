
% Experiment 24: Diet Recommendation System

% Facts - Sample diet recommendations
diet(diabetes, 'Non-starchy vegetables').
diet(diabetes, 'High-fiber whole grains').
diet(diabetes, 'Unsweetened foods').

diet(hypertension, 'Low-sodium foods').
diet(hypertension, 'Fruits and vegetables').
diet(hypertension, 'Whole grains').

diet(anemia, 'Iron-rich foods').
diet(anemia, 'Beans and lentils').
diet(anemia, 'Vitamin C-rich foods').

diet(obesity, 'Fiber-rich vegetables').
diet(obesity, 'Balanced portion sizes').
diet(obesity, 'Lean protein').

% Rule to display diet suggestions
suggest_diet(Disease) :-
    diet(Disease, Food),
    write('- '),
    writeln(Food),
    fail.

suggest_diet(_).

% Main program
main :-
    writeln('Diet Recommendation System'),
    writeln('Available conditions:'),
    writeln('diabetes, hypertension, anemia, obesity'),
    write('Enter disease name: '),
    read(Disease),
    (member(Disease,
        [diabetes, hypertension, anemia, obesity])
    ->
        writeln('Suggested Diet:'),
        suggest_diet(Disease)
    ;
        writeln('Disease not found in database')
    ).

:- initialization(main, main).
