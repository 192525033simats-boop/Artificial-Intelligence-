% A small database of names and dates of birth.
% Query: ?- person_dob(Name, Date).

person_dob(alex, date(2002, 5, 14)).
person_dob(priya, date(2001, 11, 3)).
person_dob(sam, date(2003, 2, 27)).
person_dob(mira, date(2002, 8, 19)).

born_in_year(Name, Year) :-
    person_dob(Name, date(Year, _, _)).
