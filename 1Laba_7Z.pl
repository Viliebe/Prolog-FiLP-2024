
main :-
    retractall(asked(_,_)),
    fault(Problem),
    !,
    nl,
    write('Suits you '), write(Problem), write(.), nl.
main :-
    nl,
    write('There is currently no suitable remedy for you.'), nl.

problem(dandruff):-
    query('U vas est perhot, zud ili shelushenia?').

problem(procedure):-
    query('vi kogda-nibud delali laminirovanie volos ili keratinovoe vipryamlenie').

problem(dryness):-
    query('Vashi volosi suhie i lomkie?').

problem(styler):-
    query('Polzuetes li vu fenom ili utyugom dlya volos?').

problem(dirty):-
    query('Vashi volosi bistro stanovyztsya gryaznumi i jirnumi?').

problem(unruly):-
    query('U vas vipadayuschie i neposlushnie volosi?').

fault('shampoo with salicylic acid'):-
    problem(dirty),
    problem(dandruff),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

fault('shampoo with climbazole'):-
    problem(dandruff),
    problem(unruly),
    
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

fault('shampoo with selenium disulfide'):-
    problem(dandruff),
    problem(dirty),
    
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

fault('restorative mask with keratin'):-
    problem(dryness),
    problem(styler),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

fault('revitalizing mask with collagen'):-
    problem(dryness),
    problem(unruly),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

fault('revitalizing mask with hyaluronic acid'):-
    problem(unruly),
    problem(styler),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

fault('balm with cocoa extract'):-
    problem(unruly),
    problem(dandruff),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

fault('balm with keratin'):-
    problem(dryness),
    problem(procedure),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

fault('milk protein balm'):-
    problem(dryness),
    problem(styler),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

fault('balm with panthenol'):-
    problem(dryness),
    problem(dandruff),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

fault('sulfate-free shampoo'):-
    problem(styler),
    problem(procedure),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

fault('anti-yellow shampoo'):-
    problem(procedure),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=1,!.

fault('biotin mask'):-
    problem(unruly),
    problem(dirty),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

fault('multivitamin balm with ginseng extracts and avocado oil'):-
    problem(dryness),
    problem(styler),
    problem(dirty),
    problem(unruly),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=4,!.

fault('moisturizing shampoo with aloe vera'):-
    problem(procedure),
    problem(dryness),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

fault('conditioner with cherry seed oil'):-
    problem(unruly),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=1,!.

fault('omega-6 mask'):-
    problem(procedure),
    problem(unruly),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

fault('conditioner for colored hair'):-
    problem(procedure),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=1,!.

fault('shampoo with blueberry extract and avocado oil'):-
    problem(dandruff),
    problem(unruly),
    problem(procedure),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=3,!.




query(Prompt) :-
    (   asked(Prompt, Reply) -> true
    ;   nl, write(Prompt), write(' (y/n)? '),
        read(X),(X = y -> Reply = y ; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.



