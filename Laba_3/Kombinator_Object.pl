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