
% Experiment 19: Student Teacher Subject Database

student_teacher_subject(ravi, kumar, cs101).
student_teacher_subject(rahul, priya, cs102).
student_teacher_subject(arun, ramesh, cs103).
student_teacher_subject(anitha, suresh, cs104).

% Display all student details
display_details :-
    student_teacher_subject(Student, Teacher, Code),
    write('Student: '),
    write(Student),
    write('  Teacher: '),
    write(Teacher),
    write('  Subject Code: '),
    writeln(Code),
    fail.

display_details.

% Main program
main :-
    writeln('Student Teacher Subject Database'),
    display_details.

:- initialization(main, main).
