% Towers of Hanoi: move N disks from From to To using Aux.
% Query: ?- hanoi(3, left, right, middle, Moves).

hanoi(0, _, _, _, []) :- !.
hanoi(N, From, To, Aux, Moves) :-
    integer(N), N > 0,
    Smaller is N - 1,
    hanoi(Smaller, From, Aux, To, First),
    hanoi(Smaller, Aux, To, From, Last),
    append(First, [move(From, To)|Last], Moves).
