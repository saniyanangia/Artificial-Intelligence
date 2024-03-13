% Define relations and rules
female(queen_elizabeth).
female(princess_ann).

male(prince_charles).
male(prince_andrew).
male(prince_edward).

child_of(prince_edward, queen_elizabeth).
child_of(princess_ann, queen_elizabeth).
child_of(prince_andrew, queen_elizabeth).
child_of(prince_charles, queen_elizabeth).

older_than(princess_ann,prince_andrew).
older_than(princess_ann,prince_edward).
older_than(prince_andrew,prince_edward).
older_than(prince_charles,princess_ann).
older_than(prince_charles,prince_andrew).
older_than(prince_charles,prince_edward).


% Define birth order and gender succession
isSuccession(X,Z):-
    (older_than(X,Z),male(X),male(Z));
    (older_than(X,Z),female(X),female(Z));
    (male(X),female(Z)),
    Z\=queen_elizabeth.


% Define sorting according to succession
insert(A,[B|C],[B|D]):- 
    \+ isSuccession(A,B),!,insert(A,C,D).
    insert(A,C,[A|C]).
    birth_order_gender([A|B],SortList):-birth_order_gender(B,Tail),insert(A,Tail,SortList).
    birth_order_gender([],[]). 


% Return succession list according to the sort
successionList(X, SuccessionList) :-
    findall(Y, child_of(Y, X), ChildNodes),
    birth_order_gender(ChildNodes, SuccessionList). 
