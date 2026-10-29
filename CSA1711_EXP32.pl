
% Experiment 32 - Pattern Matching Using Prolog

% Student database
student(ravi, computer_science).
student(anu, electronics).
student(rahul, mechanical).
student(priya, computer_science).
student(kiran, electronics).

% Pattern matching rule
find_student(Department) :-
    student(Name, Department),
    write('Student: '),
    writeln(Name),
    fail.

find_student(_).

% Main program
main :-
    writeln('Pattern Matching Using Prolog'),
    writeln('-----------------------------'),
    writeln('Available Departments:'),
    writeln('computer_science'),
    writeln('electronics'),
    writeln('mechanical'),
    nl,
    write('Enter Department: '),
    read(Department),
    nl,
    writeln('Matching Students:'),
    find_student(Department).

:- initialization(main, main).
