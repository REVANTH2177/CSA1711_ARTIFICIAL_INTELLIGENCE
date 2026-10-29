
% Experiment 33 - Count Number of Vowels

% Define vowels using character codes
vowel(97).   % a
vowel(101).  % e
vowel(105).  % i
vowel(111).  % o
vowel(117).  % u

% Base case
count_vowels([], 0).

% Recursive case
count_vowels([H|T], Count) :-
    count_vowels(T, Rest),
    (vowel(H) ->
        Count is Rest + 1
    ;
        Count is Rest
    ).

% Main program
main :-
    writeln('Vowel Counting Using Prolog'),
    writeln('---------------------------'),
    write('Enter a word or sentence: '),
    read_line_to_string(user_input, Text),
    string_lower(Text, LowerText),
    string_codes(LowerText, Codes),
    count_vowels(Codes, Count),
    write('Number of Vowels: '),
    writeln(Count).

:- initialization(main, main).
