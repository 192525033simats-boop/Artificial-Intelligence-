% Simple symptom-based medical diagnosis demonstration.
% Queries: ?- diagnose(Patient, Condition).  ?- diagnosis_for(alex, Condition).
% Educational example only; not a substitute for professional care.

has_symptom(alex, fever).
has_symptom(alex, cough).
has_symptom(alex, body_ache).
has_symptom(ravi, sneezing).
has_symptom(ravi, runny_nose).
has_symptom(ravi, mild_sore_throat).

diagnose(Patient, flu_like_illness) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, cough),
    has_symptom(Patient, body_ache).
diagnose(Patient, common_cold_like_illness) :-
    has_symptom(Patient, sneezing),
    has_symptom(Patient, runny_nose).

diagnosis_for(Patient, Condition) :- diagnose(Patient, Condition).
