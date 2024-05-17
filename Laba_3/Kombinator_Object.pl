%Задание 1
%Написать рекурсивную функцию, которая выводит на экран все размещения с
%повторениями из n по k для заданного алфавита.
%in_list(+List,?El)
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

%Написать рекурсивную функцию, которая выводит на экран все сочетания без
%повторений из n по k для заданного алфавита.
%razm_povt(+Alphabet,+N,+RazmCur,-Razm)
razm_povt(_,0,Razm,Razm):-!.
razm_povt(Alphabet,NCur,RazmCur,Razm):-in_list(Alphabet,El),NNew is NCur-1,razm_povt(Alphabet,NNew,[El|RazmCur],Razm).

%Написать нерекурсивную функцию, которая выводит на экран все размещения с
%повторениями из n по k для заданного алфавита.
%sochet(-Result,+Alphabet,+K)
sochet([],_,0):-!.
sochet([H|Sub_set],[H|Set],K):-K1 is K-1, sochet(Sub_set,Set,K1).
sochet(Sub_set,[H|Set],K):-sochet(Sub_set,Set,K).

%Написать нерекурсивную функцию, которая выводит на экран все сочетания без
%повторений из n по k для заданного алфавита.
make_pos_list(K, K, []):-!.
make_pos_list(K, CurPos, [NewPos|TailPos]) :- NewPos is CurPos + 1, make_pos_list(K, NewPos, TailPos).

%Написать функцию, которая строит все слова длины k, содержащие 3 буквы a на заданном алфавите.
make_3a_empty_word(K, K, _, []):-!.
make_3a_empty_word(K, CurIndex, [NewIndex|PosTail], [a|Tail]) :- 
	NewIndex is CurIndex + 1, make_3a_empty_word(K, NewIndex, PosTail, Tail),!.
make_3a_empty_word(K, CurIndex, PosList, [_|Tail]) :- 
	NewIndex is CurIndex + 1, make_3a_empty_word(K, NewIndex, PosList, Tail).	

%Написать предикат в Prolog, который получает в неунифицированную переменную
%очередное размещение из n по k с повторениями.
build_word([],[],_):-!.
build_word([a|WordTail],[X|WordEmpty3aTail],RestWord) :- 
	nonvar(X),build_word(WordTail,WordEmpty3aTail,RestWord),!.
build_word([Y|WordTail],[X|WordEmpty3aTail],[Y|RestWordTail]) :- 
	var(X),build_word(WordTail,WordEmpty3aTail,RestWordTail).

%Написать предикат в Prolog, который строит все слова длины k, содержащие 3 буквы a на заданном алфавите.
%build_3a_words(+Alphabet,+K,-Word)
build_3a_words(Alphabet,K,Word) :- make_pos_list(K, 0, PosList), 
	sochet(Pos_a_List, PosList, 3), make_3a_empty_word(K, 0, Pos_a_List, WordEmpty3a), Alphabet = [a|NewAlphabet], 
	M is K - 3, razm_povt(NewAlphabet, M, [], RestWord), build_word(Word, WordEmpty3a, RestWord).




%Задание 4
%Для всех комбинаторных объектов из вашего варианта построить 
%предикат вывода всех объектов в файл.
%ПОДМНОЖЕСТА 
%write_subsets_to_file('num4subset.txt').
%Предикат для генерации всех подмножеств заданного списка
subsets([], []).
subsets([H|T], [H|Sub]) :- subsets(T, Sub).
subsets([_|T], Sub) :- subsets(T, Sub).

% Предикат для записи всех подмножеств в файл
write_subsets_to_file(File) :-
    open(File, write, Stream),
    findall(Sub, subsets([a, b, c], Sub), AllSubsets), % Генерация всех подмножеств для списка [a, b, c]
    write_subsets(Stream, AllSubsets),
    close(Stream).

% Предикат для записи списка подмножеств в файл
write_subsets(_, []).
write_subsets(Stream, [H|T]) :-
    write(Stream, H), nl(Stream),
    write_subsets(Stream, T).



%СОЧЕТАНИЯ С ПОВТОРЕНИЯМИ 
%comb_with_rep(+List, +K, -Result)
%write_comb_to_file('num4repeat.txt', -CombList).
% Предикат для генерации сочетаний с повторениями
comb_with_rep([], 0, []).
comb_with_rep([H|T], K, [H|Comb]) :- K > 0, K1 is K - 1, comb_with_rep([H|T], K1, Comb).
comb_with_rep([_|T], K, Comb) :- K > 0, comb_with_rep(T, K, Comb).

% Предикат для записи сочетаний в файл
write_comb_to_file(File, List) :-
    open(File, write, Stream),
    write_comb(Stream, List),
    close(Stream).

write_comb(_, []).
write_comb(Stream, [Comb|T]) :-
    write(Stream, Comb), nl(Stream),
    write_comb(Stream, T).




%Слова длины 5, в которых ровно одна буква повторяется 2 раза, 
%остальные буквы не повторяются
% Предикат для генерации слов с одним повтором

% word_with_one_repeat(Word) :-
%     alphabet(Alphabet),
%     length(Word, 5),
%     findall(Char, member(Char, Word), Chars),
%     include(has_one_repeat, Chars, [RepeatChar|_]),
%     delete(Word, RepeatChar, UniqueChars),
%     append([RepeatChar, RepeatChar], UniqueChars, Word).

% % Предикат для проверки, что символ встречается ровно 2 раза
% has_one_repeat(Char, Word) :-
%     count(Word, Char, 2).

% % Предикат для записи слов в файл
% write_words_to_file(File) :-
%     open(File, write, Stream),
%     findall(Word, word_with_one_repeat(Word), Words),
%     write_words(Stream, Words),
%     close(Stream).

% write_words(_, []).
% write_words(Stream, [Word|T]) :-
%     write(Stream, Word), nl(Stream),
%     write_words(Stream, T).

% alphabet([a, b, c, d, e, f, g, h, i, j]).

%Cлова длины 9, в которых ровно 2  буквы повторяются 2 раза, 
%ровно одна буква повторяется 3 раза, остальные буквы не повторяются
count(List, Element, Count) :-
    sum_list(maplist((=Element), List), Count).
    
has_two_repeats(Char, Word) :-
    count(Word, Char, 2).

% Предикат для проверки, что символ встречается ровно 3 раза
has_three_repeats(Char, Word) :-
    count(Word, Char, 3).

% Предикат для генерации слов, удовлетворяющих условиям
word_with_two_two_repeats_one_three_repeat(Word) :-
    alphabet(Alphabet),
    length(Word, 9),
    findall(Char, member(Char, Word), Chars),
    select(Repeat1, Chars, RemainingChars1),
    select(Repeat2, RemainingChars1, RemainingChars2),
    select(Repeat3, RemainingChars2, UniqueChars),
    append([Repeat1, Repeat1, Repeat2, Repeat2, Repeat3, Repeat3, Repeat3], UniqueChars, Word).

% Предикат для записи слов в файл
write_words_to_file(File) :-
    open(File, write, Stream),
    findall(Word, word_with_two_two_repeats_one_three_repeat(Word), Words),
    write_words(Stream, Words),
    close(Stream).

write_words(_, []).
write_words(Stream, [Word|T]) :-
    write(Stream, Word), nl(Stream),
    write_words(Stream, T).

% Предикат для алфавита
alphabet([a, b, c, d, e, f, g, h, i, j]).