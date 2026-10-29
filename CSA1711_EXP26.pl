
% Experiment 26 - Fruit and Color using Backtracking

% Fruit and color database
fruit(apple, red).
fruit(banana, yellow).
fruit(mango, yellow).
fruit(orange, orange).
fruit(grapes, green).
fruit(strawberry, red).
fruit(guava, green).
fruit(watermelon, green).

% Display all fruits using backtracking
display_fruits :-
    fruit(Fruit, Color),
    write('Fruit: '),
    write(Fruit),
    write(' | Color: '),
    writeln(Color),
    fail.

display_fruits.

% Find fruits of a particular color
find_color(Color) :-
    fruit(Fruit, Color),
    write('Fruit: '),
    writeln(Fruit),
    fail.

find_color(_).

% Main program
main :-
    writeln('Fruit and Color Using Backtracking'),
    writeln('----------------------------------'),
    writeln('List of Fruits and Colors:'),
    display_fruits,
    nl,
    write('Enter a color (red/yellow/green/orange): '),
    read(Color),
    writeln('Matching Fruits:'),
    find_color(Color).

:- initialization(main, main).
