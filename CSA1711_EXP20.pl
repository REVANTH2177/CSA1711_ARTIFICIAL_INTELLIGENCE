
% Experiment 20: Planets Database

planet(mercury, 1, rocky).
planet(venus, 2, rocky).
planet(earth, 3, rocky).
planet(mars, 4, rocky).
planet(jupiter, 5, gas_giant).
planet(saturn, 6, gas_giant).
planet(uranus, 7, ice_giant).
planet(neptune, 8, ice_giant).

% Display all planets
display_planets :-
    planet(Name, Position, Type),
    write('Planet: '),
    write(Name),
    write('  Position: '),
    write(Position),
    write('  Type: '),
    writeln(Type),
    fail.

display_planets.

% Main program
main :-
    writeln('Solar System Planets Database'),
    display_planets.

:- initialization(main, main).
