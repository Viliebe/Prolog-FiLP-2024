%Задание 3 Вариант 6
%Циклический сдвиг элементов массива влево на три позиции.

%read_list(+N,-List)
read_list(0,[]):-!.
read_list(N,[Head|Tail]) :- read(Head), NewN is N - 1,
    read_list(NewN,Tail).

%write_list(+List)
write_list([]) :- !.
write_list([Head|Tail]) :- write(Head), nl, write_list(Tail).

%count(+List,+Element,-Count)
%Подсчитывает количество вхождений элемента Element в список List, количество вхождений сохраняет в Count
count(List, Element, Count):-
  findall(Element, member(Element, List), Counters),
  length(Counters, Count).

%Подзадача 1.6
%rotate_left(+List, -N, -RotatedList)
rotate_left(List, N, RotatedList) :-
    length(List, Length),
    N is 3,
    N1 is N mod Length,
    append(Head, Tail, List),
    length(Head, N1),
    append(Tail, Head, RotatedList).
    
%Подзадача 1.19
%Циклический сдвиг элементов массива вправо на одну позицию.
%rotate_right(+List, -RotatedList)
rotate_right(List, RotatedList) :-
    append(T, [H], List),
    append([H], T, RotatedList).

%Подзадача 1.33
%Проверить, чередуются ли положительные и отрицательные числа.
%intfl(+N)
intfl([],_):-!.

intfl(N):-read_list(N,List),
intfl(List,0).

intfl([H|T],0):-
H>0,
intfl(T,1).

intfl([H|T],0):-
H<0,
intfl(T,2).

intfl([H|T],1):-
H<0,
intfl(T,2).

intfl([H|T],2):-
H>0,
intfl(T,1).

