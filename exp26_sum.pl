% Sum the integers from 1 to N.
% Query: ?- sum_to_n(5, Sum).

sum_to_n(N, Sum) :-
    integer(N), N >= 0,
    sum_acc(1, N, 0, Sum).

sum_acc(Current, N, Acc, Sum) :-
    Current > N,
    Sum = Acc.
sum_acc(Current, N, Acc, Sum) :-
    Current =< N,
    NextAcc is Acc + Current,
    Next is Current + 1,
    sum_acc(Next, N, NextAcc, Sum).
