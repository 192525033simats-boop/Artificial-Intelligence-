% Backward chaining: prove a goal by matching a fact or recursively
% proving all prerequisites of a rule.
% Queries: ?- prove(eligible_for_trip).  ?- prove(ready_to_travel).

known(has_passport).
known(has_ticket).
known(has_luggage).

rule(ready_to_travel, [has_passport, has_ticket]).
rule(eligible_for_trip, [ready_to_travel, has_luggage]).

prove(Goal) :- prove(Goal, []).

prove(Goal, _) :- known(Goal).
prove(Goal, Visited) :-
    \+ memberchk(Goal, Visited),
    rule(Goal, Prerequisites),
    prove_all(Prerequisites, [Goal|Visited]).

prove_all([], _).
prove_all([Goal|Goals], Visited) :-
    prove(Goal, Visited),
    prove_all(Goals, Visited).
