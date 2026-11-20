% Facts about birds and a simple ability-to-fly rule.
% Queries: ?- can_fly(tweety).  ?- can_fly(X).  ?- cannot_fly(X).

bird(tweety).
bird(eagle1).
bird(penguin1).
bird(ostrich1).

flightless(penguin1).
flightless(ostrich1).

can_fly(Bird) :- bird(Bird), \+ flightless(Bird).
cannot_fly(Bird) :- bird(Bird), flightless(Bird).
