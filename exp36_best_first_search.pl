% Greedy best-first search. At each step, expand the node with the
% smallest heuristic value. Edges are directed.
% Query: ?- best_first(arad, bucharest, Path).

edge(arad, sibiu). edge(arad, timisoara). edge(arad, zerind).
edge(sibiu, fagaras). edge(sibiu, rimnicu_vilcea). edge(sibiu, oradea).
edge(timisoara, lugoj). edge(zerind, oradea).
edge(lugoj, mehadia). edge(mehadia, dobreta).
edge(dobreta, craiova). edge(craiova, pitesti). edge(craiova, rimnicu_vilcea).
edge(rimnicu_vilcea, pitesti). edge(rimnicu_vilcea, bucharest).
edge(fagaras, bucharest). edge(pitesti, bucharest).

heuristic(arad, 366). heuristic(sibiu, 253). heuristic(timisoara, 329).
heuristic(zerind, 374). heuristic(oradea, 380). heuristic(fagaras, 176).
heuristic(rimnicu_vilcea, 193). heuristic(lugoj, 244). heuristic(mehadia, 241).
heuristic(dobreta, 242). heuristic(craiova, 160). heuristic(pitesti, 100).
heuristic(bucharest, 0).

best_first(Start, Goal, Path) :-
    greedy([node(Start, [Start])], [], Goal, Reversed),
    reverse(Reversed, Path).

greedy([node(Goal, Path)|_], _, Goal, Path) :- !.
greedy([node(Current, Path)|Open], Closed, Goal, Result) :-
    findall(node(Next, [Next|Path]),
            (edge(Current, Next), \+ memberchk(Next, Closed),
             \+ memberchk(node(Next, _), Open)),
            Children),
    append(Open, Children, Unsorted),
    sort_open(Unsorted, Sorted),
    greedy(Sorted, [Current|Closed], Goal, Result).

sort_open(Nodes, Sorted) :-
    map_list_to_pairs(node_score, Nodes, Pairs),
    keysort(Pairs, Ordered),
    pairs_values(Ordered, Sorted).

node_score(node(Node, _), Score) :- heuristic(Node, Score).
