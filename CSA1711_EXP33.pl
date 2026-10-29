
% Experiment 33 - Count Number of Vowels

% Check whether a character is a vowel
vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

% Base case
count_vowels([], 0).

% Recursive case
count_vowels([H|T], Count) :-
    char_type(H, to_lower(Lower)),
    count_vowels(T, RestCount),
    (vowel(Lower) ->
        Count is RestCount + 1
    ;
        Count is RestCount
    ).

% Main program
main :-
    writeln('Vowel Counting Using Prolog'),
    writeln('---------------------------'),
    write('Enter a word or sentence: '),
    read_line_to_string(user_input, Text),
    string_chars(Text, Characters),
    count_vowels(Characters, Count),
    write('Number of Vowels: '),
    writeln(Count).

:- initialization(main, main).
