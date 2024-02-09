main :-
    retractall(asked(_,_)),
    fault(Problem),
    !,
    nl,
    write('It suits you '), write(Problem), write(.), nl.
main :-
    nl,
    write('We havent found a remedy for you yet.'), nl.

problem(dandruff):-
    query('Do you have dandruff?').

problem(itching):-
    query('Do you have itching and peeling?').

problem(dryness):-
    query('Has your hair become brittle and dry?').

problem(styler):-
    query('Do you often use a hair dryer and a hair iron?').

problem(dirty):-
    query('Does your hair get dirty and greasy quickly?').

problem(unruly):-
    query('Do you have unruly hair?').

problem(damaged):- 
    query('Have you previously dyed your hair or had lamination/keratin done?').



fault('shampoo_with_salicylic_acid'):-
    problem(dandruff).

fault('shampoo_with_climbazole'):-
    problem(dandruff),
    problem(itching).

fault('shampoo_with_selenium_disulfide'):-
    problem(dandruff),
    problem(itching).

fault('regenerating_mask_with_keratin'):-
    problem(unruly),
    problem(dryness),
    problem(styler).

fault('regenerating_mask_with_collagen'):-
    problem(styler),
    problem(dryness),
    problem(unruly).

fault('regenerating_mask_hyaluronic_acid'):-
    problem(dryness)
    problem(unruly),
    problem(styler).

fault('care_with_cocoa_extract'):-
    problem(damaged),
    problem(dandruff).

fault('keratin_care'):-
    problem(dryness),
    problem(itching).

fault('care_with_milk_protein'):-
    problem(dryness),
    problem(styler).

fault('care_with_panthenol'):-
    problem(dryness),
    problem(dandruff),
    problem(itching).

fault('sulfate_free_shampoo'):-
    problem(damaged).


query(Prompt) :-
    (   asked(Prompt, Reply) -> true
    ;   nl, write(Prompt), write(' (y/n)? '),
        read(X),(X = y -> Reply = y ; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.



