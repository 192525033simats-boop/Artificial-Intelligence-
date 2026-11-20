% Fruit colours, demonstrated with backtracking.
% Queries: ?- fruit_color(Fruit, Color).  ?- fruit_color(apple, Color).

fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(orange, orange).
fruit_color(grape, purple).
fruit_color(lime, green).

% Calling fruit_color(Fruit, Color) repeatedly with ; enumerates all facts.
