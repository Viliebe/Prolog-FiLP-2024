%in_list(+List,?El)
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

% Чтение строк из файла
% read_file(+FileName, -Lines)
read_file(FileName, Lines) :-
    setup_call_cleanup(
        open(FileName, read, Stream),
        read_line(Stream, Lines),
        close(Stream)
    ).

% read_line(+Stream, -Lines)
read_line(Stream, Lines) :-
    read_line_to_string(Stream, Line),
    (   Line == end_of_file
    ->  Lines = []
    ;   
    
        Lines = [Line|Tail],
        read_line(Stream, Tail)
    ).

% Запись списка строк в файл
% write_file(+FileName, +Lines)
write_file(FileName, Lines) :-
    setup_call_cleanup(
        open(FileName, write, Stream),
        write_line(Stream, Lines),
        close(Stream)
    ).


% write_line(+Stream, +Lines)
write_line(_, []).
write_line(Stream, [Line|Tail]) :-
    writeln(Stream, Line),
    write_line(Stream, Tail).

%Задание 2 Вариант 6: 3, 4, 7, 10

arrangement_with_repetitions(_, 0, []).
arrangement_with_repetitions(Alphabet, Length, [X|T]) :-
    Length > 0,
    NewLength is Length - 1,
    member(Alphabet, X),
    arrangement_with_repetitions(Alphabet, NewLength, T).
%длина наибольшей строки
%max_line(+FileName,-Res)
max_line(FileName,Res):-
read_file(FileName,Lines),
count_max(Lines,0,Res),!.

count_max([],Max,Max):-!.

count_max([H|T],Max,Res):-
string_length(H,Len),
Len > Max,
Maxt is Len,
count_max(T,Maxt,Res).

count_max([H|T],Max,Res):-count_max(T,Max,Res).

%количество строк без пробелов
%i_need_more_space(+FileName,-Res)
i_need_more_space(FileName,Res):-
read_file(FileName,Lines),
space_words(Lines,0,Res).

space_words([],Count,Count):-!.

space_words([H|T],Count,Res):-
sub_string(H,_,_,_," "),
space_words(T,Count,Res).

space_words([H|T],Count,Res):-
Countt is Count + 1,
space_words(T,Countt,Res).

%вывести строки, в которых а встречается чаще среднего
%write_awords(+FileName)
write_awrods(FileName):-
read_file(FileName,Lines),
avera(Lines,0,0,Cword,Ca),
Aver is Ca / Cword,
write(Aver),nl,
print_was(Lines,Aver).

count_a([], 0).
count_a([a|T], N) :- count_a(T, N1), N is N1 + 1.
count_a([_|T], N) :- count_a(T, N).

print_was([],Av):-!.

print_was([H|T],Av):-
string_chars(H,List),
count_a(List,C),
C>Av,
write(H),nl,
print_was(T,Av).

print_was([H|T],Av):- print_was(T,Av).

avera([],Cword,Ca,Cword,Ca):-!.
avera([H|T],Cword,Ca,Rcw,Rca):-
string_chars(H,List),
count_a(List,C),
Cat is Ca + C,
Cwordt is Cword + 1,
avera(T,Cwordt,Cat,Rcw,Rca).

% string_in_words(+Str, -Words)
string_in_words(Str, Words) :-
    split_string(Str, " ", "", Words).

%get_words_list(+Strings,+Words,-Res)
get_words_list([],Words,Words):-!.

get_words_list([H|T],Words,Res):-
string_in_words(H,Wordt),
append(Words,Wordt,RWord),
get_words_list(T,RWord,Res).

%count(+List,+Element,-Count)
count(List, Element, Count):-
  findall(Element, member(Element, List), Counters),
  length(Counters, Count).

%count_in(+List,-Res)
count_in(List,Res):-count_in(List,Popular,0,Res).

count_in([],Popular,_,Popular):-!.

count_in([H|T],Popular,PCount,Res):-
count([H|T],H,Col),
Col > PCount,
count_in(T,H,Col,Res).

count_in([H|T],Popular,PCount,Res):-
count_in(T,Popular,PCount,Res).

%popular_word(+FileName,-Res)
popular_word(FileName,Res):-
read_file(FileName,Lines),
get_words_list(Lines,[],Words),
count_in(Words,Res).

%uniq_check(+Words,+WordsIt,+Unique,-Res)
uniq_check(_,[],Unique,Unique):-!.

uniq_check([H|T],[HE|TE],Unique,Res):-
count([H|T],HE,Count),
Count = 1,
append(Unique,[HE],Uniq),
uniq_check([H|T],TE,Uniq,Res).

uniq_check([H|T],[HE|TE],Unique,Res):-
uniq_check([H|T],TE,Unique,Res).

%unique_words(+FileIn,+FileOut)
unique_words(FileIn,FileOut):-
read_file(FileIn,Lines),
get_words_list(Lines,[],Words),
uniq_check(Words,Words,[],Res),
write_file(FileOut,Res).

%Задание 4
%4.1(3)
% subsets([1, 2, 3], 'subsets.txt').
subsets(List, OutputFile) :-
    open(OutputFile, write, Stream),
    findall(Subset, subset(List, Subset), Subsets),
    write(Stream, Subsets), nl(Stream),
    close(Stream).

subset([], []).
subset([H|T], [H|Sub]) :-
    subset(T, Sub).
subset([_|T], Sub) :-
    subset(T, Sub).
%4.2(4)
%write_sochp(+Alphabet,+N,+FileName)
write_sochp(Alphabet,N,FileName):-
open(FileName,write,Stream),
findall(Soch,sochet_povt(Soch,Alphabet,N),SochL),
write_file(FileName,SochL),close(Stream).
sochet_povt([],_,0):-!.
sochet_povt([H|Sub_set],[H|Set],K):-
K1 is K-1, sochet_povt(Sub_set,[H|Set],K1).
sochet_povt(Sub_set,[H|Set],K):-
sochet_povt(Sub_set,Set,K).

%4.3(7)



%4.4(10)