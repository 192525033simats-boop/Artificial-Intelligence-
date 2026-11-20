% Classical monkey-and-banana planning example.
% Query: ?- monkey_plan(Plan).
% State is state(MonkeyPosition, BoxPosition, MonkeyOnBox, HasBanana).

monkey_plan(Plan) :-
    Initial = state(door, window, floor, no),
    plan(Initial, [], Plan).

plan(state(_, _, _, yes), _, []) :- !.
plan(State, Visited, [Action|Rest]) :-
    \+ memberchk(State, Visited),
    action(State, Action, Next),
    plan(Next, [State|Visited], Rest).

action(state(P, B, floor, no), walk(P, Q), state(Q, B, floor, no)) :-
    place(Q).
action(state(P, P, floor, no), push_box(P, Q), state(Q, Q, floor, no)) :-
    place(Q), P \= Q.
action(state(P, P, floor, no), climb, state(P, P, on_box, no)).
action(state(middle, middle, on_box, no), grasp_banana,
       state(middle, middle, on_box, yes)).

place(door).
place(middle).
place(window).
