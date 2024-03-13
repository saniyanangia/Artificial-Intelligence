% Define rules
smart_phone_technology(galactica_s3).
developed(sumsum, galactica_s3).
boss(stevey, appy).
stole(stevey, galactica_s3).
competitor(sumsum, appy).

% Define relations
competitor(X, Y) :- competitor(Y, X).
rival(X, Y) :- competitor(X, Y) , X \= Y.
business(X) :- smart_phone_technology(X).



% Return whether Stevey is unethical
unethical(X) :- boss(X, Y), developed(W, Z), business(Z), stole(X, Z), rival(Y, W).





