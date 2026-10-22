
% Experiment 18: Database with Name and DOB

student(ravi, date(12, 5, 2004)).
student(rahul, date(20, 8, 2003)).
student(priya, date(15, 3, 2004)).
student(arun, date(10, 1, 2005)).

% Display student details
display_students :-
    student(Name, DOB),
    write('Name: '),
    write(Name),
    write('  DOB: '),
    writeln(DOB),
    fail.

display_students.

% Main program
main :-
    writeln('Student Database with Name and DOB'),
    display_students.

:- initialization(main, main).
