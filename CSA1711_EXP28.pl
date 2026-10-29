
% Experiment 28 - Medical Diagnosis Using Prolog

% Disease and symptom database
symptom(flu, fever).
symptom(flu, cough).
symptom(flu, headache).

symptom(common_cold, sneezing).
symptom(common_cold, runny_nose).
symptom(common_cold, cough).

symptom(malaria, fever).
symptom(malaria, chills).
symptom(malaria, sweating).

symptom(typhoid, fever).
symptom(typhoid, weakness).
symptom(typhoid, stomach_pain).

% Diagnosis rules
diagnose(Disease, Symptoms) :-
    setof(S, symptom(Disease, S), Required),
    subset_list(Required, Symptoms).

% Check whether all required symptoms are present
subset_list([], _).

subset_list([H|T], List) :-
    member(H, List),
    subset_list(T, List).

% Display possible diseases
show_diagnosis(Symptoms) :-
    diagnose(Disease, Symptoms),
    write('Possible Disease: '),
    writeln(Disease),
    fail.

show_diagnosis(_).

% Main program
main :-
    writeln('Medical Diagnosis System'),
    writeln('------------------------'),
    writeln('Available Symptoms:'),
    writeln('fever, cough, headache, sneezing,'),
    writeln('runny_nose, chills, sweating,'),
    writeln('weakness, stomach_pain'),
    nl,
    writeln('Enter symptoms as a list.'),
    writeln('Example: [fever,cough,headache].'),
    write('Enter symptoms: '),
    read(Symptoms),
    writeln('Diagnosis Result:'),
    show_diagnosis(Symptoms),
    writeln('Note: Educational demonstration only.').

:- initialization(main, main).
