-module(euler).
-compile(export_all).


%%% 1) --- Add all the natural numbers below one thousand that are multiples of 3 or 5.
euler_1(N) -> lists:sum([X || X <- lists:seq(1,N-1), (X rem 3 == 0) or (X rem 5 == 0)]).


%%% 2) --- Find the sum of all the even-valued terms in the Fibonacci sequence which do not exceed four million.

%% Helper function that returns the Fibonacci sequence with all values less than Max
fib(Max) -> fib(1,1,Max).
fib(X,Y,Max) when (X + Y) > Max -> [ X, Y ];
fib(X,Y,Max) -> [ X|fib(Y,X+Y,Max) ].

euler_2() -> lists:sum([X || X <- fib(4000000), (X rem 2 == 0)]).


%%% 3) --- Find the largest prime factor of a composite number.
max(X,Y) when X > Y -> X;
max(_,Y) -> Y.

euler_3(X) -> euler_3(X,2).

euler_3(X,Try) when Try > X/2 -> X;
euler_3(X,Try) when X rem Try == 0 -> max(Try, euler_3(X div Try,2));
euler_3(X,Try) -> euler_3(X,Try+1).


%%% 4) --- Find the largest palindrome made from the product of two 3-digit numbers.
to_digit_list(X) when X < 10 -> [X]
to_digit_list(X) -> [|X rem 10]
% is_palindrome(X) -> 