%Задание 1
%Реализовать предикат max(+X,+Y,+U,-Z), где U максимальное из чисел X, Y и Z.
max(X,Y,Z,X):- X>Y,X>Z,!.
max(X,Y,Z,Y):- Y>X,Y>Z,!.
max(_,_,Z,Z).

%Реализовать предикат fact(N,X), где X – это факториал первого аргумента с помощью рекурсии вверх, рекурсии вниз.
%Рекурсия вверх
%fact(+N,X)
fact(0,1).
fact(N,X):- N>0,
N1 is N-1,
fact(N1,X1),
X is X1*N.

%Рекурсия вниз
%call_fact2(+N,-X)
fact2(0,X,X).
fact2(N,A,X):- N>0,
    N1 is N-1,
    A1 is A*N,
    fact2(N1,A1,X1),
    X is X1.
call_fact2(N,X):-fact2(N,1,X).

%Найти сумму цифр числа с помощью рекурсии вверх. Найти сумму цифр числа с помощью рекурсии вниз.
%Рекурсия вверх
%sum_num_up(+N,-S).
sum_num_up(0,0):-!.
sum_num_up(N,S):-N1 is N div 10,
sum_num_up(N1,S1),
S is S1+N mod 10.

%Рекурсия вниз
%sum_um_down(+N,-S).
%cifr_sum_down(+N,-S)
cifr_sum_down(N,S):-cifr_sum_down(N,S,0).
cifr_sum_down(0,S,S):-!.
cifr_sum_down(N,S,X):-X1 is X + N mod 10,
N1 is N div 10,
cifr_sum_down(N1,S,X1).

%Проверить, является ли число свободным от квадратов.
%call_square_free(+Num)
call_square_free(Num):-square_free(Num,2).
square_free(Num,Num):-!.
square_free(Num, Squarer):-
Square is Squarer*Squarer,
Moded is Num mod Square,
Moded \= 0,
Squarer_temp is Squarer + 1,
square_free(Num,Squarer_temp).

%Реализовать предикат чтения списка с клавиатуры и предикат вывода списка на экран.
%read_list(+N,-List)
read_list(0,[]):-!.
read_list(N,[Head|Tail]) :- read(Head), NewN is N - 1,
    read_list(NewN,Tail).
%write_list(+List)
write_list([]) :- !.
write_list([H|T]) :- write(H), nl, write_list(T).

%Реализовать предикат sum_list_down(+List, ?Summ), sum_list_up(+List, ?Summ), которые проверяют, является ли
%Summ суммой элементов списка или записывает в эту переменную сумму элементов. Выполнить рекурсией вниз и вверх соответственно.
%sum_list_down(+List, -Sum)
sum_list_down(List,Sum) :- sum_list_down(List,0,Sum).
sum_list_down([],CurSum,CurSum):-!.
sum_list_down([H|T],CurSum,Sum) :- NewSum is CurSum + H,
    sum_list_down(T,NewSum,Sum).

%read_sum_write(+C)
read_sum_write(C):- read_list(C,List),
sum_list_down(List,Sum),
write(Sum).

%sum_list_up(+List,-Sum)
sum_list_up([],0):-!.
sum_list_up([H|T],Sum) :- sum_list_up(T,SumTail), Sum is SumTail + H.

%sum_cifr_del(+List,-X,+Number)
sum_cifr_del([],[],Number). 
sum_cifr_del([H|T],X,Number):-cifr_sum_down(H,Sum),
Sum==Number,sum_cifr_del(T,X,Number). 
sum_cifr_del([H|X],[H|Y],Number):-sum_cifr_del(X,Y,Number). 



%Задание 2 Вариант 6
%Найти минимальную цифру числа.
%min_cifr(+Number,-Result)
min_cifr(Number,Result):-min_cifr(Number,10,Result).

min_cifr(0,Result,Result):-!.

min_cifr(Number,Min,Result):-Cifr is Number mod 10,
Cifr < Min,
Number_temp is Number div 10,
min_cifr(Number_temp,Cifr,Result).

min_cifr(Number,Min,Result):-
Number_temp is Number div 10,
min_cifr(Number_temp,Min,Result).

%Найти количество цифр числа, меньших 3
%kolvo(num, -count)
kolvo(Number, Count) :-
    kolvo_helper(Number, 0, Count).

kolvo_helper(0, Count, Count):-!.
kolvo_helper(Number, Acc, Count) :-
    Digit is Number mod 10,
    Digit < 3,
    NewNumber is Number div 10,
    NewAcc is Acc + 1,
    kolvo_helper(NewNumber, NewAcc, Count).

kolvo_helper(Number, Acc, Count) :-
    NewNumber is Number div 10,
    kolvo_helper(NewNumber, Acc, Count).

%Найти количество делителей числа
%count_divisors(+N, -Count)
divisors(X, Y) :- 0 is X mod Y.
count_divisors(N, Count) :- count_divisors(N, 1, 0, Count).

count_divisors(N, N, Acc, Count) :- Count is Acc + 1.
count_divisors(N, I, Acc, Count) :-
    I < N,
    0 is N mod I,
    NewAcc is Acc + 1,
    NextI is I + 1,
    count_divisors(N, NextI, NewAcc, Count).
count_divisors(N, I, Acc, Count) :-
    I < N,
    NextI is I + 1,
    count_divisors(N, NextI, Acc, Count).