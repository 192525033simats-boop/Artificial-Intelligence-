% Classroom diet suggestion rules based on a stated condition.
% Query: ?- diet_for(diabetes, Suggestion).
% These sample rules are not medical advice.

diet_for(diabetes, choose_balanced_meals_with_plenty_of_nonstarchy_vegetables).
diet_for(diabetes, limit_sugary_drinks_and_refined_sweets).
diet_for(hypertension, reduce_sodium_and_choose_fresh_foods).
diet_for(hypertension, include_fruits_vegetables_and_whole_grains).
diet_for(anemia, include_iron_rich_foods_such_as_beans_and_leafy_greens).
diet_for(obesity, prefer_portion_aware_meals_and_regular_activity).

recommendation(Condition, Suggestion) :- diet_for(Condition, Suggestion).
