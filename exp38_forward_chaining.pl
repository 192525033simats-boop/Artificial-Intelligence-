% Forward chaining over a small set of propositional rules.
% Query: ?- derive_all(Known), member(eligible_for_trip, Known).

initial_fact(has_passport).
initial_fact(has_ticket).
initial_fact(has_luggage).

forward_rule(ready_to_travel, [has_passport, has_ticket]).
forward_rule(eligible_for_trip, [ready_to_travel, has_luggage]).

derive_all(Facts) :-
    findall(Fact, initial_fact(Fact), Initial),
    forward_closure(Initial, Facts).

forward_closure(Facts, Result) :-
    ( forward_rule(New, Conditions),
      \+ memberchk(New, Facts),
      subset(Conditions, Facts)
    -> append(Facts, [New], Expanded),
       forward_closure(Expanded, Result)
    ;  Result = Facts
    ).
