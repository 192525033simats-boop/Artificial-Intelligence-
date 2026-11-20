% Family tree. The prompt supplies genders but no parent links, so these
% parent/2 facts are example data and can be edited for the assigned family.
% Queries: ?- mother(X, jim).  ?- sister(X, bob).  ?- grandfather(X, pat).

female(pam).
female(liz).
female(ann).
female(pat).
male(tom).
male(bob).
male(jim).

% Example relationships: Tom and Pam have Bob and Liz; Bob and Ann have
% Jim and Pat. Each parent link is recorded separately.
parent(tom, bob).
parent(pam, bob).
parent(tom, liz).
parent(pam, liz).
parent(bob, jim).
parent(ann, jim).
parent(bob, pat).
parent(ann, pat).

mother(Mother, Child) :- female(Mother), parent(Mother, Child).
father(Father, Child) :- male(Father), parent(Father, Child).
grandfather(GF, Child) :- male(GF), parent(GF, Parent), parent(Parent, Child).
grandmother(GM, Child) :- female(GM), parent(GM, Parent), parent(Parent, Child).
sister(Sister, Person) :- female(Sister), sibling(Sister, Person).
brother(Brother, Person) :- male(Brother), sibling(Brother, Person).

sibling(A, B) :- parent(P, A), parent(P, B), A \= B.
